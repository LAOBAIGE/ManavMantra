classdef FigureInspectorRegistrator < internal.matlab.inspector.peer.InspectorRegistrator
    % Registers component property inspector views
    % This will be called during the property inspector build process
    
    % Copyright 2017 The MathWorks, Inc.
    
    methods
        function registerInspectorComponents(obj)
            % This file needs to be build and changed to incorporate our
            % changes
            % internal.matlab.inspector.peer.InspectorFactory.buildRegistration([(matlabroot) '/toolbox/matlab/datatools/inspector/registration/inspectorProxyViewMapCache.mat'],'inspector','matlab.graphics.internal')
            % NOTE: Make sure you touch toolbox\matlab\datatools\inspector\registration\buildRegistration.m file when updating any property views
            applicationNames = {
                % default
                ''; ...
                };
            
            % Components To Register
            %
            % This list should be able to be updated without needing to update any code
            % further down
            
            components = {
                'matlab.ui.Figure', ...
                'matlab.graphics.axis.Axes', ...
                'matlab.graphics.chart.primitive.Line', ...
                'matlab.graphics.primitive.Text',...
                'matlab.graphics.chart.primitive.Bar',...
                'matlab.graphics.shape.TextArrow',...
                'matlab.graphics.shape.TextBox',...
                'matlab.graphics.shape.Arrow',...
                'matlab.graphics.shape.Rectangle',...
                'matlab.graphics.primitive.Surface',...
                'matlab.graphics.chart.primitive.Surface',...
                'matlab.graphics.illustration.Legend',...
                'matlab.graphics.primitive.Patch',...
                'matlab.graphics.primitive.Rectangle',...
                'matlab.graphics.shape.Line',...
                'matlab.graphics.shape.Ellipse',...
                'matlab.graphics.shape.DoubleEndArrow',...
                'matlab.graphics.chart.primitive.Area',...
                'matlab.graphics.chart.primitive.Scatter',...
                'matlab.graphics.chart.primitive.Stair',...
                'matlab.graphics.chart.primitive.Stem',...
                'matlab.graphics.primitive.Line',...
                'matlab.graphics.animation.AnimatedLine',...
                'matlab.graphics.axis.PolarAxes',...
                'matlab.graphics.chart.primitive.Contour',...
                'matlab.graphics.chart.primitive.GraphPlot',...
                'matlab.graphics.chart.primitive.Binscatter',...
                'matlab.graphics.primitive.Image',...                
                'matlab.graphics.primitive.Light',...
                'matlab.graphics.chart.HeatmapChart',...
                'matlab.graphics.chart.primitive.ErrorBar',...
                'matlab.graphics.chart.primitive.Histogram',...
				'matlab.graphics.chart.primitive.Histogram2',...
                'matlab.graphics.function.FunctionSurface',...
                'matlab.graphics.function.ImplicitFunctionLine',...
                'matlab.graphics.function.ImplicitFunctionSurface',...
                'matlab.graphics.function.ParameterizedFunctionLine',...
                'matlab.graphics.function.ParameterizedFunctionSurface',...
                'matlab.graphics.illustration.ColorBar',...
                'matlab.graphics.chart.primitive.categorical.Histogram',...
                'matlab.graphics.function.FunctionLine',...
                'matlab.graphics.chart.GeographicBubbleChart',...
                'matlab.graphics.chart.primitive.ConstantLine',...
                'matlab.graphics.chart.primitive.FunctionLine',...
                'matlab.graphics.chart.WordCloudChart',...
                'matlab.ui.container.Panel',...
                'matlab.graphics.primitive.Polygon',...		
                'matlab.graphics.chart.primitive.tall.Scatter',...
                'matlab.graphics.chart.primitive.tall.Line',...
                'textanalytics.chart.TextScatter'...
                };
            
            % Loop over all components
            for componentIdx = 1:length(components)
                
                componentFullName = components{componentIdx};
                indices = regexp(componentFullName, '\.');
                componentShortName = componentFullName(indices(end) + 1 : end);
                
                switch (true)
                    case contains(componentFullName,'.tall.')
                        componentShortName = ['Tall' componentShortName]; %#ok<AGROW>
                    case contains(componentFullName,'.categorical.')
                        componentShortName = ['Categorical' componentShortName]; %#ok<AGROW>
                    case contains(componentFullName,'.primitive.')
                        if strcmpi(componentFullName,'matlab.graphics.chart.primitive.Line')
                            componentShortName = ['Chart' componentShortName];  %#ok<AGROW>
                        else
                            componentShortName = ['Primitive' componentShortName]; %#ok<AGROW>
                        end
                    otherwise
                end
                
                
               
                % Assume its matlab.graphics.internal.propertyinspector.views.<ShortName>PropertyView
                %
                % Ex:
                % matlab.graphics.internal.propertyinspector.views.AxesPropertyView
                propertyViewClass = sprintf('matlab.graphics.internal.propertyinspector.views.%sPropertyView', componentShortName);
                
                % Loop over all applications
                for applicationIdx = 1:length(applicationNames)
                    
                    applicationName = applicationNames{applicationIdx};
                    
                    try
                        defaultObj = feval(componentFullName);
                    catch
                        defaultObj = [];
                    end
                    disp(['componentFullName: ' componentFullName])
                    % Register all the objects specified
                    internal.matlab.inspector.peer.InspectorFactory.registerInspectorView(...
                        componentFullName, ...
                        applicationName, ...
                        propertyViewClass, ...
                        defaultObj ...
                        );
                    
                    if ~isempty(defaultObj)
                        delete(defaultObj);
                    end
                end
            end
        end
    end
end
