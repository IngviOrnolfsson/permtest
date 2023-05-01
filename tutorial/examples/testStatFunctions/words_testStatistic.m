function t = words_testStatistic(aw)

% Partition input
age = aw(:,1);
words = aw(:,2);

% Fit words model (see function for details)
mdl = fitWords(age,words);

% Research questions

% Final number of words learned?
FWL = mdl.a;

% Overall word learning "delay"?
WLD = _________;

% Peak learning rate? (Hint: slope at midpoint = a*s/4)
PLR = _________;

% Number of words learned between ages 2 and 5 (Hint: mdl(x) returns the model prediction at x)
W25 =_________;

% Change assignment to one of the above as necessary
t = FWL;



