function GraphGUI(gui,materialFig)
%% Adjust Main GUI window and create Graph panel
set(gui.Figure,'Units','Normalized','OuterPosition',[0 .1 1 .9]);
GraphArea = uipanel('Parent',gui.Figure,'Position',[.666,.3,.333,.7]);
MassArea = uipanel('Parent',gui.Figure,'Position',[.666,0,.333,.3]);
%% Mass Output
mass = num2str(materialFig.Mass);
MassOuput = uicontrol(MassArea,'Style','text',...
    'String',strcat(mass,' lb(s)'),'Units','normalized',...
    'FontSize',36,'Position',[0.05,.35,0.9,.6]);
FileOutput = uicontrol(MassArea,'Style','text',...
    'String','Enter File Name:','Units','normalized',...
    'FontSize',14,'Position',[.25,.55,.25,.1]);
FileInput = uicontrol(MassArea,'Style','edit',...
    'Max',1,'Min',1,'BackgroundColor','white',...
    'Units','normalized','FontSize',14,...
    'Position',[.5,.55,.25,.1]);
xSpace = 0.05;
SaveResult = uicontrol(MassArea,'Style','pushbutton',...
    'String','Save Results','Units','normalized',...
    'FontSize',20,...
    'Position',[0.02,0.05,0.5-(xSpace/2),0.4],'Callback',{@SaveValues,materialFig});
    function SaveValues(~,~,r)
        saveName = get(FileInput,'String');
        if strcmp(saveName,'')
            error('Invalid file name entered')
        end
        S = dbstack('-completenames');
        fullPath = S(1).file;
        currfileName = S(1).name;
        className = class(gui);
        folderName = fullPath(1:(end-(length(currfileName)+length('private')+length(className)+5-length('/Savevalues')))); %#ok<COLND>
        cd(folderName)
        if exist('Results','dir') ~= 7
            mkdir('Results')
        end
        save(strcat('Results\',saveName),'r');
    end

LoadGraph = uicontrol(MassArea,'Style','pushbutton',...
    'String','Load Saved Results','Units','normalized',...
    'FontSize',20,...
    'Position',[0.5+(xSpace/2),.05,.5-.05,.4],'Callback',{@LoadResults});
    function LoadResults(~,~)
        ResultsGUI(gui);
    end
%% Create the text and listbox
%Resize the figure
%Delete old results
delete(GraphArea);
%Create new results panel and resize the files panel
GraphArea = uipanel('Parent',gui.Figure,'Position',[.666,.3,.333,.7]);
%Get the results
[results,calcNames] = getResults(materialFig);

bar1axes = axes('Parent',GraphArea);
bar(bar1axes,results);
bar1axes.XLim=[0 length(calcNames)+1];
bar1axes.XTickLabel=calcNames;
bar1axes.XTickLabelRotation=30;
bar1axes.YLim=[0 4];
bar1axes.YGrid='on';
titlehandle=title('Factors of Safety');
titlehandle.FontSize=20;
legendhandle.FontSize=15;
legendhandle.Location='northeastoutside';

set(gca,'FontSize',15);%'fontWeight','bold')

end


function [results,calcNames] = getResults(r)
calcNamesTemp = {'Simple Beam','Cantilevered Beam','Compression',...
    'Buckling','Torsion','Torsional Buckling'};
numCalcs = length(calcNamesTemp);
resultsTemp = zeros(1,numCalcs);
resultsTemp(1,1)=r.FoS_SSB;
resultsTemp(1,2)=r.FoS_CB;
resultsTemp(1,3)=r.FoS_Comp;
resultsTemp(1,4)=r.FoS_Buckling;
resultsTemp(1,5)=r.FoS_Torsion;
resultsTemp(1,6)=r.FoS_TB;

emptyData = ones(1,numCalcs);
for k = 1:numCalcs
    if resultsTemp(1,k)~=0
        emptyData(k)=0;
    end
end
results=[]; calcNames=[];
for k= 1:length(emptyData)
    if emptyData(k)==0
        results=[results,resultsTemp(1,k)];
        calcNames=[calcNames,calcNamesTemp(1,k)];
    end
end
end