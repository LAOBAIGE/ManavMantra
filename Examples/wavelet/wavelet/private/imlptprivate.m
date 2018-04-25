function xrec = imlptprivate(w,t,nj,moments,varargin)
% This is a private version of MLPT. This is to avoid unnecessary
% double validation and parsing of inputs. 
% This is not intended to be called directly, use MLPT instead.
% This function may change in a future release.
ndual = 2;
if ~isempty(varargin)
    ndual = varargin{1};
end
L = length(nj)-1;
J = L;
startIdx = 1;
levels = cumsum(nj);
Mcoarse = moments(startIdx:startIdx+levels(1)-1);
tcoarse = t(1:2^J:end);
% Obtain initial scaling coefficients
ScalingCoefs = w(1:levels(1),:);
% Enter the synthesis loop

for jj = 1:L
    tfine = t(1:2^(J-1):end);
    Mfine = moments(levels(jj)+1:levels(jj+1),:);
    % Obtain detail coefficients
    Details = w(levels(jj)+1:levels(jj+1),:);
    % Call the synthesis routine to reverse the lifting steps
    sj = wavelet.internal.MLPTSynthesis(tfine,tcoarse,Details,ScalingCoefs,...
        Mfine,Mcoarse,ndual);
    % Prepare for next step
    ScalingCoefs = sj;
    Mcoarse = Mfine;
    tcoarse = tfine;
    J = J-1;
end
xrec = sj;

