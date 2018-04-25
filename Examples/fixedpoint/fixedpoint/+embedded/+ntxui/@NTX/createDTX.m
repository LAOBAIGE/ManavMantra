function createDTX(ntx)
% Create Datatype Explorer overlay widgets

%   Copyright 2010-2013 MathWorks, Inc.

dp = ntx.dp;
hContextMenu = dp.hContextMenu;

% Shift the cursor positions by the amount specified by the offset.
xUnder = ntx.XAxisDisplayMin+ntx.HistBarOffset;
xOver = ntx.XAxisDisplayMax+ntx.HistBarOffset;

% ywordline is a dummy value during creation that stands
% in for the desired y-position of the wordspan line
ywordline = 0;

ax_yMax = 10; % dummy

% Fraction/Integer separator line
%
% xxx zbuffer bug: x-axis labels disappear if z=-1. Since the radix point is
% now at a negative location on the x-axis, add the BarGapCenter instead.
hlRadixLine = line( ...
    'Parent',ntx.hHistAxis, ...
    'Color',ntx.ColorFixedLine, ...
    'Visible','off',...
    'Tag','RadixLine',...
    'Clipping','off',... % for HG2 compatibility.
    'LineWidth',2, ...
    'XData',[0 0] + ntx.RadixPt - ntx.BarGapCenter, ...
    'YData',[0 ywordline], ...
    'ZData', [-2 -2]);  % [-1.1 -1.1]

% Data type word length (WL) text
xpos = +0.5;
htWordSpan = text('Parent',ntx.hHistAxis, ...
    'VerticalAlignment','top', ...
    'String',getString(message('fixed:NumericTypeScope:UI_WL_Word_Length_Abbreviation')), ...
    'HorizontalAlignment','center', ...
    'Tag','WordSpan', ...
    'Visible','off',...
    'UIContextMenu',hContextMenu, ...
    'Color','k', ...
    'BackgroundColor','w', ...
    'Units','data', ...
    'Position',[xpos 0 2]); % dummy y-pos
set(htWordSpan,'Units','char');

% Draw wordsize horizontal span line
if ntx.EnableWordSizeLineDrag
    clr = ntx.ColorManualThreshold;
else
    clr = ntx.ColorFixedLine;
end
hlWordSpan = line('Parent',ntx.hHistAxis, ...
    'Color',clr, ...
    'Tag','WordLengthLine',...
    'LineWidth',3, ...
    'Visible','off',...
    'Clipping','off',... % for HG2 compatibility.
    'XData', [xUnder xOver], ...
    'YData', [ywordline ywordline], ...
    'ZData', [-2 -2]);

% Integer- and fractional-part word size text
% Place text 1/2-char below line
xpos = (xOver+ntx.RadixPt)/2 - ntx.BarGapCenter;
htIntSpan = text('Parent',ntx.hHistAxis, ...
    'String',getString(message('fixed:NumericTypeScope:UI_IL_Integer_Length_Abbreviation')), ...
    'HorizontalAlignment','center', ...
    'VerticalAlignment','top', ...
    'Tag','IntSpan', ...
    'Visible','off',...
    'UIContextMenu',hContextMenu, ...
    'Color','k', ...
    'BackgroundColor','w', ... % to suppress radix line
    'Units','data', ...
    'Position',[xpos 0 1]);
set(htIntSpan,'Units','char');

% Text (FL) for Fractional-part has a context menu
% for choosing what to display (fraction length or scale factor)
xpos = (xUnder+ntx.RadixPt)/2 - ntx.BarGapCenter;
htFracSpan = text('Parent',ntx.hHistAxis, ...
    'String',getString(message('fixed:NumericTypeScope:UI_FL_Fraction_Length_Abbreviation')), ...
    'HorizontalAlignment','center', ...
    'VerticalAlignment','top', ...
    'Color','k', ...
    'Visible','off',...
    'BackgroundColor','w', ... % to suppress radix line
    'Tag','FracSpan', ... % used for context menu building
    'UIContextMenu',hContextMenu, ...
    'Units','data', ...
    'Position',[xpos 0 1]);
set(htFracSpan,'Units','char');

% Create drag-able line for underflow threshold
hlUnder = line( ...
    'Parent',ntx.hHistAxis, ...
    'Color',ntx.ColorManualThreshold, ...
    'Tag','UnderflowLine',...
    'Visible','off',...
    'LineWidth',3, ...
    'Clipping','off',... % for HG2 compatibility.
    'XData',[xUnder xUnder], ...
    'YData',[0 ax_yMax], ...
    'ZData',[0 0]);

% Underflow text that tracks underflow line
%
% For x-axis, set it about a quarter bin higher than xUnder to
% keep text a small distance away from touching the vertical line.
% For y-axis, we left 20% (data space) vertical gutter for info
xpos = xUnder+0.2; % 0.2 bins for gutter
htUnder = text('Parent',ntx.hHistAxis, ...
    'String',getString(message('fixed:NumericTypeScope:UI_below_precision_with_parens')), ...
    'BackgroundColor','w', ... % to suppress radix line
    'HorizontalAlignment','right', ...
    'VerticalAlignment','top', ...
    'Visible','off',...
    'Tag','Underflows', ... % used for context menu building
    'UIContextMenu',hContextMenu, ...
    'Units','data', ...
    'Position',[xpos 0 1]);
set(htIntSpan,'Units','char');

% Create drag-able line for overflow threshold
hlOver = line( ...
    'Parent',ntx.hHistAxis, ...
    'Color',ntx.ColorManualThreshold, ...
    'Tag','OverflowLine',...
    'Visible','off',...
    'LineWidth',3, ...
    'Clipping','off',... % for HG2 compatibility.
    'XData',[xOver xOver], ...
    'YData',[0 ax_yMax], ...
    'ZData',[0 0]);

% Overflow text that tracks overflow line
xpos = xOver-0.2;
htOver = text('Parent',ntx.hHistAxis, ...
    'String',getString(message('fixed:NumericTypeScope:UI_outside_range_with_parens')), ...
    'BackgroundColor','w', ... % to suppress radix line
    'HorizontalAlignment','left', ...
    'Visible','off',...
    'VerticalAlignment','top', ...
    'Tag','Overflows', ... % used for context menu building
    'UIContextMenu',hContextMenu, ...
    'Units','data', ...
    'Position',[xpos 0 1]);
set(htOver,'Units','char');

% DTX handles
ntx.hlOver    = hlOver;   % Overflow line
ntx.htOver    = htOver;   % Overflow text
ntx.hlUnder   = hlUnder;  % Underflow line
ntx.htUnder   = htUnder;  % Underflow text

% LastUnder and LastOver
% These are values of the exponent, N, and not the weights, 2^N,
% indicating the graphical position of the underflow and overflow cursors.
% Both must be integer-valued exponents > 0.
%
% Required interpretation:
%  OVERFLOW: any value >= 2^LastOver is an overflow  (not > !!)
%     Why? We keep the graphical cursor on or close to the nearest integer
%     exponent.  In the limit of no gap between bars, the cursor sits on
%     an integer value.  This value is defined as being in the bar that
%     extends above the cursor location, and thus is in the overflow region.
%     The ">=" is critical.  It cannot be ">".
%         
%  UNDERFLOW: any value < 2^LastUnder is an underflow (not <= !!)
%     Why? Similar to the above, the cursor sits on an integer
%     value that is defined as being part of the bar that extends above the
%     cursor location, and thus is NOT in the underflow region.
%     Again, the "<" is critical.  It cannot be "<=".
%
% We can simply set these to empty here.  They get overwritten during
% startup by a call to resetThresholds().
ntx.LastOver = [];
ntx.LastUnder = [];

ntx.WhichLineDragged     = 0; % 0=neither, 1=under, 2=over
ntx.WhichLineDraggedLast = 1; % to break tie when both cursors coincide
ntx.LockThresholds       = false; % synchronize threshold cursors
ntx.yWordSpan            = ywordline; % y-coord of word line

ntx.hlRadixLine = hlRadixLine;
ntx.hlWordSpan  = hlWordSpan;
ntx.htWordSpan  = htWordSpan;
ntx.htIntSpan   = htIntSpan;
ntx.htFracSpan  = htFracSpan;

% For vertical rescaling via mouse-drag on WordSpan line
% Used as state for current and next vertical position
%
% Requires empty as default value
ntx.LastDragWordSizeLine = [];