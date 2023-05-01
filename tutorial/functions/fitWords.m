function mdl = fitWords(age,words)

% Set options for logistic fit
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
ft =  fittype('a/(1+exp((m-x)*s))'); % Fit function
% a: asymptote
% m: midpoint
% s: scaling parameter

% Starting points and boundaries for fitting procedure
opts.StartPoint = [10000 5 0.5];
opts.Lower=[5000 0 0];
opts.Upper=[15000 10 100];

mdl = fit(age,words,ft,opts);  
