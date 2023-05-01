%% Example 4: Learning danish words

% Goals: 
% - This example is particularly useful if you do modelling
% - Again, start by loading and plotting the data to see how it looks (run this section)
% - Open words_testStatistic, which we will use to calculate test statistics
% - This function calls fitWords, which fits the logistic curve
% - The mdl object contains all the parameters from the fitting procedure
% - In words_testStatistic, there are four research questions. Fill in the
%   blanks to create statistics to answer these questions. Use the last
%   line to switch between statistics.

% Load word learning data
words = load('wordLearning.mat');
ageDK = words.ageDanish;
wordsDK = words.wordsDanish;
awDK = [ageDK wordsDK];

ageOt = words.ageOther;
wordsOt = words.wordsOther;
awOt = [ageOt wordsOt];

% Plot
plotWords;

words_statfun = @(x) words_testStatistic(x);
permtest({awDK,awOt},100,words_statfun)

% Discussion points
% - Can you use permutation tests in your own research? How?
% - Can permutation tests always replace parametric tests?
% - What are pitfalls of using permutation tests?

