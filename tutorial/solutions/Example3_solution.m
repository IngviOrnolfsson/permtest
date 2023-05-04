%% Example 3: CPH distances

% NB! Run part 1 first - proceed to part 2 when you're finished with part 1.


% Goals: 
% - This test statistics here are a bit harder to calculate
% - Start by loading and plotting the data to familiarize yourself with it (run this section)
% - Open the function CPH_testStatistic and fill out the blanks
% - The function has two outputs, one for the distances calculated, 
%   and one for the test statistic (mean of distances)
% - Switch betwee distOther and distRadhuspladsen to answer the two
%   research questions; ignore the provided distMin statistic (for now)
% - Compare your results with the MATLAB's t-test

% Load positions
cph = load('cph');
bodegas = cph.bodegas;
cocktailbars = cph.cocktailbars;

% Plot 
plotBars;


%% Part 1 - Permutation test
cph_statfun = @(x) CPH_testStatistic(x);
permtest({bodegas,cocktailbars},1000,cph_statfun)


%% Part 2 - Alternative permutation approach
% - We could also calculate the statistic first, and then permute these
%   results. This is done here: 

[~,distB] = CPH_testStatistic(bodegas);
[~,distC] = CPH_testStatistic(cocktailbars);
permtest({distB,distC},10000)
[~,pcph] = ttest2(distB,distC);

% Discussion points
% - What is the difference between the two permutation approaches?
% - Could it have consequences for your conclusions?
% - Do they represent different research questions?


%% Bonus questions, if you find everything super easy so far: 
% - Try using the provided distMin test statistic
% - This statistic measures the average distance to the nearest neighbor
% - What is the difference between the two permutation approaches now?