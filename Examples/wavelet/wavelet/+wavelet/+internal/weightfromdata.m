function [weight,deltaweight] = weightfromdata(x,maxiter,transformtype)
%   This function is for internal use only. It may change in a future
%   release.
%
%   The empirical Bayes method used here is a MATLAB implementation of the
%   R package.
%
%   Silverman, B. (2012) EbayesThresh: Empirical Bayes Thresholding and
%   Related Methods, http://CRAN.R-project.org/package=EbayesThresh.
%
%   References:
%   Johnstone, I. & Silverman, B. (2005). EbayesThresh: R Programs for
%   Empirical Bayes Thresholding, Journal of Statistical Software, 12,1,
%   pp. 1-38.


% weight is a scalar if X is a vector. If X is a matrix, then weight will
% be a vector
[m,n] = size(x);
tmpweight = NaN(1,n);
% Obtain Donoho-Johnstone universal threshold
% The X data now have unit standard deviation
if strcmpi(transformtype,'decimated')
    thr = sqrt(2*log(m));
elseif strcmpi(transformtype,'nondecimated')
    thr = sqrt(2*log(m*log2(m)));
end
% wlo can be a scalar or row vector. wlo forms the lower bound of the
% search for the mixing weight in the interval [wlo,1]
wlo = repmat(wavelet.internal.weightfromthr(thr),1,n);

% beta is a vector or matrix with the same size as X. See the help for
% betacauchy for a description of \beta(x). \beta(x) is such that the
% derivative of marginal log likelihood function is the sum of
% \dfrac{\beta(x_i)}{1+\beta(x_i))
beta = wavelet.internal.betacauchy(x);


% The upper limit of 10^20 is arbitrary, but note that 10^20 corresponds
% a N(\theta,1) RV exceeding 10 standard deviations
% beta = min(beta,1e20);
beta = min(beta, realmax('double'));
% This forms whi in the interval [wlo,whi] 
whi = ones(size(tmpweight));
deltaweight(1,:) = whi-wlo;

% This is the derivative of the marginal log likelihood function evaluated
% at w=1.
shi = sum(beta./(1 + beta));

% If the value S(w=1) is not negative, there is no chance of finding
% S(w)=0, so choose w=1.  If all sequences have no solution S(w)=0, abort
% now.
shiNonNeg = shi>=0;
if any(shiNonNeg)
    % If there are any nonnegative, find the indices and set them equal to
    % 1.
    tmpweight(shiNonNeg) = 1;
    if all(shiNonNeg)
        weight = tmpweight;
        return;
    end
end



slo = sum(beta./(1+wlo.*beta));
sloNonPos = slo <= 0;
if any(sloNonPos)
    % If there are any nonpositive, find the indices and set those equal to
    % wlo
    tmpweight(sloNonPos) = wlo(sloNonPos);
    initialwlo = wlo(sloNonPos);
end

conTol = Inf;
% Abort when numerically we're not getting anywhere (w changes close to
% machine precision) or the value S(w) becomes very close to 0.
wtol = 100*eps(1);
stol = 1e-7;
ii = 1;

while conTol > wtol

    % geometric mean of whi and wlo. This should not be complex because
    % wlo is nonnegative. wmid is a scalar or vector. We could also
    % exponentiate the mean of the logarithms
    
    % Find the geometric mean of [wlo,1] recall wlo depends on the
    % universal threshold
    wmid = sqrt(whi.*wlo);

    % smid is a scalar or row vector -- this is the derivative of the 
    % marginal log likelihood
    smid = sum(beta./(1+wmid.*beta));
    
    % Abort when the value S(w) is sufficiently small for all data vectors.
    smidZero = abs(smid) < stol;
    if any(smidZero)
        % Save the sufficiently small weights, and see if all weights are
        % determined.
        tmpweight(smidZero) = wmid(smidZero);
        if ~any(isnan(tmpweight))
            weight = tmpweight;
            return;
        end
    end
    smidPos = smid>0;
    % If smid > 0, then replace wlo with wmid so now the interval is
    % [wmid,whi]
    wlo(smidPos) = wmid(smidPos);
    smidNeg = smid < 0;
    % If smid is negative, replace the high with wmid
    whi(smidNeg) = wmid(smidNeg);
    
    % Testing convergence
    deltaweight(ii+1,:) = whi-wlo;
    % The step difference should be going more negative
    conTol = abs(max(deltaweight(ii+1,:)-deltaweight(ii,:)));
    ii = ii+1;
    if ii > maxiter
        break;
    end
end

tmpweight = sqrt(wlo.*whi);
tmpweight(shiNonNeg) = 1;

if any(sloNonPos)
    tmpweight(sloNonPos) = initialwlo;
end
weight = tmpweight;


