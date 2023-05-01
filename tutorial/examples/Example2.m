%% Example 2: HEA grades

% Goals: 
% - Is there a significant difference between the two courses?
% - If so, in terms of which statistics?
% - We'll go through a) together
% - It's up to you to define the test statistic for b) and c)

% Load grades
g = load('grades.mat');
g22001 = g.g22001;      % Acoustic Signal Processing
g22003 = g.g22003;      % Auditory Signal Processing and Perception

% grades.mat metadata:
%   - No -3s were given
%   - Not showing up is coded as NaN
%   - Grades from the two courses do NOT represent paired samples 
%     (it's just by chance that there are the same amount of students)

%% a) Mean grades
meanfun = @(x) mean(x,'omitnan');
permtest({g22001,g22003},1000,meanfun);
[~,pt] = ttest2(g22001,g22003);

%% b) fail percentage
failfun = @(x) ______________;
permtest(___,___,failfun);

%% c) showup percentage
showfun = _________;
permtest(___,___,___,___,___);

% Discussion points
% - Is it necessary to use a permtest in these cases?
% - What are the (dis)advantages of permtest vs. parametric tests?
% - What happens if you change "mean" to "median" in question a)?