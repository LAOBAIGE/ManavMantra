function TF = isuniform(t)
% This function determines if a time vector is uniformly sampled
% This function is for internal use only and may be modified in a future
% release.

N = length(t);
startTime = t(1);
endTime = t(end);
tunif = linspace(startTime,endTime,N)';
maxerr = max(abs(t-tunif)./max(abs(t)));
TF = maxerr < 3*eps(class(t));
