function t = words_testStatistic(aw)

% Partition input
age = aw(:,1);
words = aw(:,2);

% Fit words model (see function for details)
mdl = fitWords(age,words);

% Research questions

% Final number of words learned?
FWL = mdl.a;

% Peak learning rate? (Hint: slope at midpoint = a*s/4)
PLR = mdl.a*mdl.s/4;

% Overall word learning "delay"?
WLD = mdl.m;

% Number of words learned between ages 2 and 5
W25 = mdl(5)-mdl(2);

% Change assignment to one of the above as necessary
t = W25;



