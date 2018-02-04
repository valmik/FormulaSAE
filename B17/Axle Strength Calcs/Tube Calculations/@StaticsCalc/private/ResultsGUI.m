function ResultsGUI(gui)
close all;
%% Get the names of the results files
S = dbstack('-completenames');
fullPath = S(1).file;
fileName = S(1).name;
className = class(gui)
folderName = fullPath(1:(end-(length(fileName)+length('private')+length(className)+5))); %#ok<COLND>

cd(folderName)

resFiles = dir('.\Results\*.mat');
resNames = cell(length(resFiles),1);
for q = 1:length(resFiles)
    resNames{q} = resFiles(q).name(1:end-4);
end

%% Create the figure
fig=figure('Name','StaticsCalc Results');
set(fig,'Units','Normalized','OuterPosition',[.15 .35 .15 .4]);

%% Create the panels
filesPanel = uipanel('Parent',fig,'Position',[0,0,1,1]);
resultsPanel = uipanel('Parent',fig,'Position',[.25,0,.75,1]);
resultsPanel.Visible='off';

%% Create the text and listbox
resListText = uicontrol(filesPanel,'Style','text',...
    'String','Select results to compare:',...
    'Units','normalized',...
    'FontSize',14,...
    'Position',[0,.9,1,.1]);

resListBox = uicontrol(filesPanel,'Style','listbox',...
    'String',resNames,...
    'Units','normalized',...
    'Position',[0,.3,1,.6],...
    'FontSize',14,...
    'Callback', {@updateGraph},...
    'Max', 10);

    function updateGraph(object,~)
        %Get data out of the listbox
        selected = object.Value;
        tubeNames = object.String(selected);
        numTubes = length(tubeNames);
        %Get the results
        [results,mass,calcNames] = getResults(tubeNames);
        
        %Resize the figure
        set(fig,'Units','Normalized','OuterPosition',[.15 .15 .6 .6]);
        %Delete old results
        delete(resultsPanel);
        %Create new results panel and resize the files panel
        resultsPanel = uipanel('Parent',fig,'Position',[.2,0,.8,1]);
        filesPanel.Position = [0,0,.2,1];
        if numTubes > 1
            resultsPanel.Position=[.2 0 .6 1];
        end
        
        
        bar1axes = axes('Parent',resultsPanel);
        
        bar(bar1axes,results);
        if numTubes == 1
            bar1axes.XLim=[0 length(calcNames)+1];
            legendhandle=legend(tubeNames);
            bar1axes.XTickLabel=calcNames;
            bar1axes.XTickLabelRotation=30;
            
            massText = uicontrol(resultsPanel,'Style','Text',...
                'Units','Normalized',...
                'String',['Weight: ',num2str(mass),' lb'],...
                'FontSize',15);
            massText.Position(1:2)=[.8,.4];
            massText.Position(3:4) = massText.Extent(3:4);
            
        else
            bar1axes.XLim=[0 numTubes+1];
            bar1axes.XTickLabel=tubeNames;
            bar1axes.XTickLabelRotation=20;
            legendhandle=legend(calcNames);
        end
        bar1axes.YLim=[0 4];
        
        titlehandle=title('Factors of Safety');
        titlehandle.FontSize=20;
        legendhandle.FontSize=10;
        legendhandle.Location='northeastoutside';
        bar1axes.YGrid='on';
        ylabel('Factor of Safety to Failure')
        set(gca,'FontSize',14);%'fontWeight','bold')
        if numTubes>1
            massGraph();
        end
        function massGraph()
            %Make the figure larger
            set(fig,'Units','Normalized','OuterPosition',[.15 .15 .8 .6]);
            %Create new results panel and resize the files panel
            massPanel = uipanel('Parent',fig,'Position',[.77,0,.25,1]);
            resultsPane.Position=[.2,0,.6,1];
            
            %massPanel.Visible='off';
            massAxes = axes('Parent',massPanel);
            bar(massAxes,mass,2);
            massAxes.XLim=[0 length(mass)+1];
            massAxes.XTickLabel=tubeNames;
            massAxes.XTickLabelRotation=40;
            
            massAxes.YGrid='on';
            ylabel('Weight (lb)')
            title('Weight Comparison')
            set(gca,'FontSize',12);%'fontWeight','bold')
            
        end
    end

CalcNew = uicontrol(filesPanel,'Style','pushbutton',...
    'String','Calculate New Results','Units','normalized',...
    'FontSize',14,...
    'Position',[.1,.05,.8,.2],'Callback',{@LoadCalcs});
    function LoadCalcs(~,~)
        close all;
        gui.Figure=figure('Name','Statics Calculator');
        set(gui.Figure,'Units','Normalized','OuterPosition',[0 .1 .3 .9]);
        LoadGUI(gui);
    end
end

function [results,mass,calcNames] = getResults(tubeNames)
numTubes = length(tubeNames);
data = cell(numTubes,1);
for k = 1:numTubes
    temp=load(['.\Results\',tubeNames{k},'.mat']);
    data{k}=temp.r;
end
calcNamesTemp = {'Simple Beam','Cantilevered Beam','Compression','Buckling','Torsion','Torsional Buckling'};
numCalcs = length(calcNamesTemp);
resultsTemp = zeros(numTubes,numCalcs);
mass=zeros(numTubes);
for k = 1:numTubes
    resultsTemp(k,1)=data{k}.FoS_SSB;
    resultsTemp(k,2)=data{k}.FoS_CB;
    resultsTemp(k,3)=data{k}.FoS_Comp;
    resultsTemp(k,4)=data{k}.FoS_Buckling;
    resultsTemp(k,5)=data{k}.FoS_Torsion;
    resultsTemp(k,6)=data{k}.FoS_TB;
    mass(k)=data{k}.Mass;
end

emptyData = ones(1,numCalcs);
for k = 1:numCalcs
    for j=1:numTubes
        if resultsTemp(j,k)~=0
            emptyData(k)=0;
            break
        end
    end
end
results=[]; calcNames=[];
for k= 1:length(emptyData)
    if emptyData(k)==0
        results=[results,resultsTemp(:,k)];
        calcNames=[calcNames,calcNamesTemp(:,k)];
    end
end
end


