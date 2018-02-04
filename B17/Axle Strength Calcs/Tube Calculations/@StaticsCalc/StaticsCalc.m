classdef StaticsCalc < handle
    % StaticsCalc creates a GUI to assist in the calculation of stresses
    % and deflections for a variety of materials, loads, and shapes.
    %   HOW DOES IT WORKS?!
    
    properties
        Figure;
    end
    
    events
        Compute %Used to tell loads to scrape data
    end
    
    methods
        function gui = StaticsCalc()
            %Go to the StaticsCalc directory. Otherwise all file searching breaks.
            S = dbstack('-completenames');
            fullPath = S(1).file;
            className = class(gui);
            folderName = fullPath(1:(end-(2*length(className)+4))); %#ok<COLND>
            
            cd(folderName);

            gui.CreateGUI();
        end
        
        function CreateGUI(gui)
            %% General values and panels
            gui.Figure = figure('Name','Load or Calculate');
            set(gui.Figure,'Units','Normalized','OuterPosition',[.25 .25 .5 .5]);
            LC = uipanel('Parent',gui.Figure,'Position',[0,0,1,1]);
            LoadGraph = uicontrol(LC,'Style','pushbutton',...
                'String','Load Saved Results','Units','normalized',...
                'FontSize',20,...
                'Position',[.1,.1,.8,.35],'Callback',{@LoadResults});
            LoadCalc = uicontrol(LC,'Style','pushbutton',...
                'String','Calculate New Results','Units','normalized',...
                'FontSize',20,...
                'Position',[.1,.55,.8,.35],'Callback',{@LoadCalcs});
            function LoadResults(~,~)
                ResultsGUI(gui);
            end
            function LoadCalcs(~,~)
                close all;
                gui.Figure=figure('Name','Statics Calculator');
                set(gui.Figure,'Units','Normalized','OuterPosition',[0 .1 .3 .9]);
                LoadGUI(gui);
            end
        end
    end
end