%% Example 1: Alpaca wool quality
startup;

% Goals: 
% - Calculate the p-value for the alpaca wool quality example
% - Try using both a one-sided and a two-sided test (use [] to skip an input argument)
% - Try using different values of Np

newshampoo = [7.4 4.4 8.3 4.3 7.2 4.1 7.7 5.8 8.3 6.2 4.8 7.1];
oldshampoo = [4.1 5.4 5.1 5.8 2.8 4.4 5.6 4.2 4.6 3.8 4.6 3.9];

permtest({newshampoo,oldshampoo},10000);

% Discussion points
% - How did the p-values compare between the one- and two-sided tests?
% - What value of Np would you say is appropriate, as a minimum?
