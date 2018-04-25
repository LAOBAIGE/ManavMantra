function [wthr,thr] = fdrthreshcfs(w,nj,varargin)
%   This function is for internal use only. It may change in a future
%   release.
%   The function thresholds coefficients using false discovery rate with a
%   specified q-value (the default is 0.05).
%   The thresholding is hard.

sigma = [];

if isvector(w) && ~iscell(w) && isrow(w)
    w = w(:);
    RowVector = true;
else
    RowVector = false;
end

if ~isempty(varargin) && numel(varargin)==1
    q = varargin{1};
    sigma = [];
elseif ~isempty(varargin) && numel(varargin)==2
    q = varargin{1};
    sigma = varargin{2};
end

if ~iscell(w)
    L = length(nj)-1;
    wthr = w;
    Numcoefs = cumsum(nj);
    
    for lev = L:-1:1
        [wthr(Numcoefs(lev)+1:Numcoefs(lev+1),:),thr] = ...
            FDRthreshold(w(Numcoefs(lev)+1:Numcoefs(lev+1),:),q,sigma);
    end
    
else
    wthr = cell(size(w));
    thr = cell(size(w));
    for lev = 1:length(w)
        [wthr{lev},thr{lev}] = FDRthreshold(w{lev},q,sigma);
    end
end


if RowVector
    wthr = wthr.';
end



%--------------------------------------------------------------------------
function [dout,thr] = FDRthreshold(x,q,stdev)
if isempty(stdev)
    % If the standard deviation estimate is empty, we are using
    % level-dependent estimation of \sigma.
    normfac = 1/(-sqrt(2)*erfcinv(2*0.75));
    stdev = normfac*median(abs(x-median(x)));
end


M = size(x,1);
N = size(x,2);

% Guard against zero standard deviation. This protects against edge cases
% where the input is a constant signal, i.e. the variance is zero.
minstd = 1e-9;
stdev(stdev< minstd) = minstd;

% Change to zero-mean approximately unit-std RVs. Use absolute value
xtmp = abs((x-mean(x))./stdev);
xtmp = sort(xtmp,'descend');
% 1-normcdf
p = 1/2*erfc(xtmp./sqrt(2));
% Probabilty is corrected for one-sided test
psort = 2*p;

% Sort data values -- the smaller p-values will correspond to the largest
% data values so this sorts the order statistics of the wavelet
% coefficients in decreasing magnitude
xsort = sort(abs(x),1,'descend');
n = size(p,1);
pval = repmat(q*(1:n)/n,size(x,2),1)';
pdiff = psort-pval;
% Guard against empty
zerorow = zeros(1,size(pdiff,2));
pdiff = [zerorow; pdiff];
% Find last nonpositive index in each column
rowidx = arrayfun(@(x)find(pdiff(:,x)<=0,1,'last'),1:N);
% Correct for the added zero row for row indices greater than 1
rowidx(rowidx>1) = rowidx(rowidx>1)-1;
shift = 0:M:(N-1)*M;
% Convert to linear index
idx = rowidx+shift;
% Extract threshold for sorted data instead of inverse normal
%thr = xsort(idx);
thr = xsort(idx);
thr = repmat(thr,M,1);
% Hard thresholding is the only option for FDR
dout = wthresh(x,'h',thr);



