function [peakAF, peakCF] = morsepeakfreq(ga,be)
% peakfreq = morsepeakfreq(ga,be) returns the peak frequency for the 
% zero-th order member of the Morse wavelet family parameterized by ga
% (gamma) and be (beta).

% peak frequency for 0-th order Morse wavelet is
% $(\frac{\beta}{\gamma})^{1/\gamma}$
peakAF = exp(1/ga*(log(be)-log(ga)));
% Obtain the peak frequency in cyclical frequency
peakCF = peakAF/(2*pi);
