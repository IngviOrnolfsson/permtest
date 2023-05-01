%% Example 0 - Two normal distributions
startup;

% Goals: 
% - Play around with the distribution parameters
% - Get an intuitive feel for how they affect the outcome (histogram and p-value)
% - Verify that it returns similar p-value as the t-test
% - Feel free to take a look at the permtest function and see what's inside

% Create two normal distributions 
N1 = 100;            % Size of the first sample
N2 = 100;            % Size of second sample
Np = 1000;          % Number of permutations to make
d = 0.2;            % Distance between distributions
s1 = 1;             % Sigma of distribution 1
s2 = 1;             % Sigma of distribution 2

x1 = randn(N1,1)*s1;
x2 = randn(N2,1)*s2+d;

% Permutation test - plots result if no target for output
permtest({x1,x2},Np,[],[],'indep');

% Independent t-test
[~,pt] = ttest2(x1,x2);

% Discussion points
% - Did the permutation test always provide similar p-values as the t-test?
