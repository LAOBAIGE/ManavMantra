function [hb,hl] = dynamicBar(hax,width,offset,xrange,rgb)
% Create default dynamic bargraph plot.
% hb = dynamicBar(...) creates a patch for a bar plot.
% [hb,hl] = dynamicBar(...) also creates a line for each bar.
% Creates all-zero data to initialize bar and line.

%   Copyright 2010 The MathWorks, Inc.

[xp,zp,xl,zl,cp] = embedded.ntxui.NTX.createXBarData(xrange,width,offset,rgb);

axesVisible = get(hax,'Visible');
% Create histogram bars as a single patch
%
% xxx Bug: When erasemode is specified, cdata is NOT interpreted correctly
%    'erasemode','background', ...
yp = ones(size(xp));
hb = patch('Parent',hax, ...
           'FaceColor','flat', ...
           'EdgeColor','k', ...
           'Visible',axesVisible,...
           'XData', xp, ...
           'YData', yp, ...
           'ZData', zp, ...
           'CData', cp);

if nargout>1
    % Create sign line
    yl = zeros(size(xl))+0.5;
    hl = line('Parent',hax, ...
              'Tag','SignLine',...
              'Color','w', ...
              'Visible',axesVisible,...
              'XData',xl, ...
              'YData',yl, ...
              'ZData',zl);
end