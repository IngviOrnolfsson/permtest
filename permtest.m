function [p,Tperm,Tobs] = permtest(X,Np,statFun,sidedness,type,progFlag)

%%% Perform permutation test using arbitrary test statistic.
% Use [] to skip input arguments.

arguments
    X cell                              % Input data to process; cell index determines label
    Np = 10000;                         % Number of permutations
    statFun = @(x) mean(x,'omitnan')    % Function to compute test statistic
    sidedness (1,:) char = 'two'        % One or two-sided test ['one' or 'two']
    type (1,:) char = 'indep'           % Independent or paired sample test ['indep' or 'paired']
    progFlag logical = true             % Flag to display progress
end

if isempty(Np);         Np = 10000;                         end
if isempty(statFun);    statFun = @(x) mean(x,'omitnan');   end
if isempty(sidedness);  sidedness = 'two';                  end
if isempty(type);       type = 'indep';                     end
if isempty(progFlag);   progFlag = true;                    end

% TO DO: Check number of arguments to functions

% Select distance function
switch sidedness
    case 'one'
        distFun = @(t1,t2) t1-t2;
    case 'two'
        distFun = @(t1,t2) abs(t1-t2);
end

% Reshape data arrays if necessary
for m = 1:2
    if size(X{m},1) < size(X{m},2)
        X{m} = X{m}';
    end
end

% Get dimensions
[n1,m1] = size(X{1});
[n2,m2] = size(X{2});
assert(m1==m2); m = m1;
Ntot = n1+n2;

% Compute observed test statistic
Tobs = distFun(statFun(X{1}),statFun(X{2}));

% Preallocate
Tperm = zeros(Np,1);

% Select type of test
switch type

    case 'paired'
        % Paired samples currently only works with 1D input data
        assert(size(X{1},2)==1)
        assert(size(X{2},2)==1)

        % Combine into single array
        Xboth = [X{1} X{2}];

        for i = 1:Np
            Xperm = shuffle(Xboth,2);
            Tperm(i) = distFun(statFun(Xperm(:,1)),statFun(Xperm(:,2)));

            % Display progress
            if mod(i,100)==0 && progFlag
                disp(['permtest: ' num2str(i/Np*100) '% done'])
            end
        end

    case 'indep'
        % Combine into single array
        Xboth = [X{1};X{2}];

        % Permutation loop
        for i = 1:Np

            % Get permuted indices 
            idxPerm = randperm(Ntot);
            idx1 = idxPerm(1:n1);
            idx2 = idxPerm(n1+1:end);

            % Compute test statistic using permuted indices
            Tperm(i) = distFun(statFun(Xboth(idx1,:)),statFun(Xboth(idx2,:)));

            % Display progress
            if mod(i,100)==0 && progFlag
                disp(['permtest: ' num2str(i/Np*100) '% done'])
            end
        end
end

% Compute p-value
p = mean(Tobs <= Tperm);


%% Plotting
if nargout == 0

    
figure();clf;
tiledlayout(m+1,1)

for i = 1:m
[~,e] = histcounts([X{1}(:,i);X{2}(:,i)],20);
nexttile
histogram(X{1}(:,i),'DisplayName',['Group 1, N = ' num2str(n1)],'BinEdges',e);
hold on
histogram(X{2}(:,i),'DisplayName',['Group 2, N = ' num2str(n2)],'BinEdges',e);
title(['Variable ' num2str(i)])
legend;
end

nexttile
histogram(Tperm,'DisplayName',['$T_{perm}$, $N_{perm}$ = ' num2str(Np)])
hold on
xline(Tobs,'k--','DisplayName',['$T_{obs}$, $p = ' num2str(p) '$' ])
title('Test statistic')
legend;
ltxFormat()
end

% Utility function for shuffling
function out = shuffle(mat,dim)
arguments
    mat
    dim int32
end

dims = size(mat);

if dim == 1
    for i = 1:dims(2)
        shuffled = randperm(dims(dim));
        out(:,i) = mat(shuffled,i);
    end

elseif dim == 2
    for i = 1:dims(1)
        shuffled = randperm(dims(dim));
        out(i,:) = mat(i,shuffled);
    end
else
    error('dimension not supported')
end