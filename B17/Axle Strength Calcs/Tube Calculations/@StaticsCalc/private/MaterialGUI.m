function MaterialGUI(gui,loadsFig)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%% Material
spaceY = 0.05;
x = 0.05;
y = 0.85;
%yBetween = 0.1;
set(gui.Figure,'Units','Normalized','OuterPosition',[0 .1 .6 .9]);
MatArea = uipanel('Parent',gui.Figure,'Position',[0.5,0,.5,1]);
TextInput = uicontrol(MatArea,'Style','text',...
    'String','Pick your Material','Units','normalized',...
    'FontSize',19,'Position',[x,y,0.9,spaceY]); %#ok<NASGU>

MatGroup = uibuttongroup('Parent',MatArea,...
    'Title','Select a material group','FontSize',14,...
    'SelectionChangedFcn',@MatGroup_SelectionChangedFcn,...
    'Units','normalized','Position',[x,y-(2*spaceY),.9,2*spaceY]);
MatButtons{1} = uicontrol(MatGroup,'Style','radiobutton',...
    'FontSize',14,'Tag','Isotropic',...
    'String','Isotropic','Value',0,'Units','normalized',...
    'Position',[x+0.05,y-(8*spaceY),.4,.5]);
MatButtons{2} = uicontrol(MatGroup,'Style','radiobutton',...
    'FontSize',14,'Tag','Composite',...
    'String','Composite','Value',0,'Units','normalized',...
    'Position',[x+0.45,y-(8*spaceY),.4,.5]);
MatButtons{1}.Value = 0;
%% Varible names used in nexted functions
MatIsoMenu=[];
DropFail=[];
InputFail=[];
MatFiMenu=[];
MatMMenu=[];
MatLMenu=[];
InputLen=[];
InputOD=[];
InputID=[];
InputX=[];
InputY=[];
InputTHK=[];

    function MatGroup_SelectionChangedFcn(~,eventdata, ~)
        %% Isotropic
        Failure = 'Hi';
        FileListAll = dir('Materials\Isotropic\*.txt');
        for temp = 1:length(FileListAll)
            tempValue = FileListAll(temp).name;
            FileList{temp} = tempValue(1:end-4);
        end
        Blanket = uicontrol(MatArea,'Style','text',...
            'Units','normalized',...
            'FontSize',14,'Visible','on',...
            'Position',[x,.5,1,.25]);
        MatIsoMenu = uicontrol(MatArea,'Style','popupmenu',...
            'String',FileList,'Units','normalized',...
            'FontSize',14,'Visible','off',...
            'Callback',{@DropFailFunc},...
            'Position',[x,y-(4*spaceY),.9,1.5*spaceY]);
        TextFail = uicontrol(MatArea,'Style','text','Visible','off',...
            'String','Failure (ksi):','Units','normalized','FontSize',14,...
            'Position',[x+0.225,y-(5*spaceY),0.225,spaceY]);
        DropFail = uicontrol(MatArea,'Style','popupmenu','Visible','off',...
            'String',{'Yield','Ultimate','Other'},'Value',1,'FontSize',14,...
            'BackgroundColor','white','Units','normalized',...
            'Callback',{@DropFailFunc},...
            'Position',[x+0.225+0.225,y-(5*spaceY),0.225,spaceY]);
        InputFail = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','FontSize',14,...
            'Position',[x+.7,y-(4.7*spaceY),0.225,spaceY*0.67],'Visible','off');
        FatigueButton = uicontrol(MatArea,'Style','pushbutton',...
                'String','S-N Curve','Units','normalized',...
                'FontSize',14,'Visible','off','Callback',{@FatigueImage},...
                'Position',[x,y-(4.7*spaceY),0.225,spaceY*.67]);
            
        function FatigueImage(~,~)
            Temp = get(MatIsoMenu,'String');
            iso = Temp{get(MatIsoMenu,'Value')};
            currentFolder = pwd;
            imageLoc = '\Materials\Isotropic\';
            s = strcat(currentFolder,imageLoc,iso,'.jpg');
            I = imread(s);
            n = figure('Name','SN Curve');
            imshow(I)
        end
        %% Composite
        FileListAll = dir('Materials\Fibers\*.txt');
        for i = 1:length(FileListAll)
            tempValue = FileListAll(i).name;
            FileListF{i} = tempValue(1:end-4);
        end
        FileListAll = dir('Materials\Matrix\*.txt');
        for i = 1:length(FileListAll)
            tempValue = FileListAll(i).name;
            FileListM{i} = tempValue(1:end-4);
        end
        FileListAll = dir('Materials\Layups\*.txt');
        for i = 1:length(FileListAll)
            tempValue = FileListAll(i).name;
            FileListL{i} = tempValue(1:end-4);
        end
        TextMatFi = uicontrol(MatArea,'Style','text','Visible','off',...
            'String','Fiber:','Units','normalized','FontSize',14,...
            'Position',[x,y-(4*spaceY),0.225,1.5*spaceY]);
        MatFiMenu = uicontrol(MatArea,'Style','popupmenu',...
            'String',FileListF,'Units','normalized',...
            'FontSize',14,'Visible','off',...
            'Position',[x+0.225,y-(4*spaceY),.9-0.225-x,1.5*spaceY]);
        TextMatM = uicontrol(MatArea,'Style','text','Visible','off',...
            'String','Matrix:','Units','normalized','FontSize',14,...
            'Position',[x,y-(5*spaceY),0.225,1.5*spaceY]);
        MatMMenu = uicontrol(MatArea,'Style','popupmenu',...
            'String',FileListM,'Units','normalized',...
            'FontSize',14,'Visible','off',...
            'Position',[x+0.225,y-(5*spaceY),.9-0.225-x,1.5*spaceY]);
        TextMatL = uicontrol(MatArea,'Style','text','Visible','off',...
            'String','Layups:','Units','normalized','FontSize',14,...
            'Position',[x,y-(6*spaceY),0.225,1.5*spaceY]);
        MatLMenu = uicontrol(MatArea,'Style','popupmenu',...
            'String',FileListL,'Units','normalized',...
            'FontSize',14,'Visible','off',...
            'Position',[x+0.225,y-(6*spaceY),.9-0.225-x,1.5*spaceY]);
        %% Switch
        function DropFailFunc(~,~)
            InputFail.Visible = 'off';
            FatigueButton.Visible = 'off';
            Temp = get(DropFail,'String');
            Failure = Temp{get(DropFail,'Value')};
            if strcmp(Failure,'Other')
                InputFail.Visible = 'on';
                Temp = get(MatIsoMenu,'String');
                iso = Temp{get(MatIsoMenu,'Value')};
                FileListPic = dir('Materials\Isotropic\*.jpg');
                for i = 1:length(FileListPic)
                    tempValue = FileListPic(i).name;
                    FileListPicF{i} = tempValue(1:end-4);
                end
                temp = true;
                i = 1;
                while temp == true && i<=length(FileListPic)
                    if strcmp(FileListPicF{i},iso)
                        temp = false;
                        FatigueButton.Visible = 'on';
                    end
                    i = i+1;
                end
            else
                InputFail.Visible = 'off';
                FatigueButton.Visible = 'off';
            end
        end
        switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
            case 'Isotropic'
                MatFiMenu.Visible = 'off';
                MatMMenu.Visible = 'off';
                MatLMenu.Visible = 'off';
                TextMatFi.Visible = 'off';
                TextMatM.Visible = 'off';
                TextMatL.Visible = 'off';
                MatIsoMenu.Visible = 'on';
                TextFail.Visible = 'on';
                DropFail.Visible = 'on';
            case 'Composite'
                MatIsoMenu.Visible = 'off';
                TextFail.Visible = 'off';
                DropFail.Visible = 'off';
                InputFail.Visible = 'off';
                FatigueButton.Visible = 'off';
                MatFiMenu.Visible = 'on';
                MatMMenu.Visible = 'on';
                MatLMenu.Visible = 'on';
                TextMatFi.Visible = 'on';
                TextMatM.Visible = 'on';
                TextMatL.Visible = 'on';
        end
        refresh(gui.Figure)
    end
%% Tube
TextTube = uicontrol(MatArea,'Style','text',...
    'String','Pick your Tube','Units','normalized',...
    'FontSize',19,'Position',[x,.5,0.9,spaceY]);
TubeGroup = uibuttongroup('Parent',MatArea,...
    'Title','Select a tube','FontSize',14,...
    'SelectionChangedFcn',@TubeGroup_SelectionChangedFcn,...
    'Units','normalized','Position',[x,.4,.9,2*spaceY]);
TubeButtons{1} = uicontrol(TubeGroup,'Style','radiobutton',...
    'FontSize',14,'Tag','Circle',...
    'String','Circle','Value',0,'Units','normalized',...
    'Position',[x+0.05,.3,.4,.5]);
TubeButtons{2} = uicontrol(TubeGroup,'Style','radiobutton',...
    'FontSize',14,'Tag','Rectangle',...
    'String','Rectangle','Value',0,'Units','normalized',...
    'Position',[x+0.45,.3,.4,.5]);
TubeButtons{1}.Value = 0;
    function TubeGroup_SelectionChangedFcn(~,eventdata, ~)
        TextLen = uicontrol(MatArea,'Style','text',...
            'String','Length (in):','Units','normalized','FontSize',14,...
            'Position',[x,.33,.225,spaceY],'Visible','off');
        InputLen = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','Visible','off','FontSize',14,...
            'Position',[x+.225,.34,.225,spaceY]);
        
        TextOD = uicontrol(MatArea,'Style','text',...
            'String','OD (in):','Units','normalized','FontSize',14,...
            'Position',[x+.45,.33,.225,spaceY],'Visible','off');
        InputOD = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','Visible','off','FontSize',14,...
            'Position',[x+.675,.34,.225,spaceY]);
        
        TextID = uicontrol(MatArea,'Style','text',...
            'String','ID (in):','Units','normalized','FontSize',14,...
            'Position',[x+.45,.27,.225,spaceY],'Visible','off');
        InputID = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','Visible','off','FontSize',14,...
            'Position',[x+.675,.28,.225,spaceY]);
        
        TextX = uicontrol(MatArea,'Style','text',...
            'String','X (in):','Units','normalized','FontSize',14,...
            'Position',[x+.45,.33,.225,spaceY],'Visible','off');
        InputX = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','Visible','off','FontSize',14,...
            'Position',[x+.675,.34,.225,spaceY]);
        
        TextY = uicontrol(MatArea,'Style','text',...
            'String','Y (in):','Units','normalized','FontSize',14,...
            'Position',[x+.45,.27,.225,spaceY],'Visible','off');
        InputY = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','FontSize',14,...
            'Position',[x+.675,.28,.225,spaceY],'Visible','off');
        
        TextTHK = uicontrol(MatArea,'Style','text',...
            'String','Thickness (in):','Units','normalized','FontSize',14,...
            'Position',[x,.27,.225,spaceY],'Visible','off');
        InputTHK = uicontrol(MatArea,'Style','edit',...
            'Max',1,'Min',1,'BackgroundColor','white',...
            'Units','normalized','Visible','off','FontSize',14,...
            'Position',[x+.225,.28,.225,spaceY]);
        
        Cover = uicontrol(MatArea,'Style','text',...
            'Units','normalized','FontSize',14,...
            'Position',[x,.27,.225*2,spaceY+0.015],'Visible','off');
        switch get(eventdata.NewValue,'Tag') % Get Tag of selected object.
            case 'Circle'
                TextX.Visible = 'off';
                InputX.Visible = 'off';
                TextY.Visible = 'off';
                InputY.Visible = 'off';
                TextTHK.Visible = 'off';
                InputTHK.Visible = 'off';
                TextLen.Visible = 'on';
                InputLen.Visible = 'on';
                TextOD.Visible = 'on';
                InputOD.Visible = 'on';
                TextID.Visible = 'on';
                InputID.Visible = 'on';
                Cover.Visible = 'on';
            case 'Rectangle'
                TextOD.Visible = 'off';
                Cover.Visible = 'off';
                InputOD.Visible = 'off';
                TextID.Visible = 'off';
                InputID.Visible = 'off';
                TextLen.Visible = 'on';
                InputLen.Visible = 'on';
                TextX.Visible = 'on';
                InputX.Visible = 'on';
                TextY.Visible = 'on';
                InputY.Visible = 'on';
                TextTHK.Visible = 'on';
                InputTHK.Visible = 'on';
        end
    end
Compute = uicontrol(MatArea,'Style','pushbutton',...
    'String','Compute','Units','normalized',...
    'FontSize',20,...
    'Position',[0.25,0.16,0.5,0.1],'Callback',{@DoMath,gui});
    function DoMath(~,~,gui)
        %%  Material
        if get(MatButtons{2},'Value') == 1
            Mate = 'Composite';
        else
            Mate = 'Isotropic';
        end
        switch Mate
            case 'Isotropic'
                Temp = get(MatIsoMenu,'String');
                iso = Temp{get(MatIsoMenu,'Value')};
                Temp = get(DropFail,'String');
                switch Temp{get(DropFail,'Value')}
                    case 'Other'
                        Temp = get(InputFail,'string');
                        Fail = str2double(Temp);
                        if isnan(Fail) || Fail == 0
                            error('Invalid failure stress entered');
                        end
                    case 'Yield'
                        Fail = 'Yield';
                    case 'Ultimate'
                        Fail = 'Ultimate';
                end
                Material = Isotropic(iso,Fail);
            case 'Composite'
                Temp = get(MatFiMenu,'String');
                Fi = Temp{get(MatFiMenu,'Value')};
                Temp = get(MatMMenu,'String');
                M = Temp{get(MatMMenu,'Value')};
                Temp = get(MatLMenu,'String');
                Lay = Temp{get(MatLMenu,'Value')};
                Fi = Fiber(Fi);
                M = Matrix(M);
                Material = Composite(Fi,M,Lay);
        end
        %% Tube
        if get(TubeButtons{2},'Value') == 1
            Shape = 'Rectangle';
        else
            Shape = 'Circle';
        end
        switch Shape
            case 'Circle'
                Length = str2double(get(InputLen,'String'));
                OD = str2double(get(InputOD,'String'));
                ID = str2double(get(InputID,'String'));
                if isnan(Length) || Length == 0
                    error('invalid length entered')
                elseif isnan(OD) || OD == 0
                    error('invalid OD entered')
                elseif ID >= OD
                    error('invalid ID entered')
                end
                if isnan(ID)
                    ID = 0;
                end
                Tube = Circle(Length,OD,ID);
            case 'Rectangle'
                Length = str2double(get(InputLen,'String'));
                X = str2double(get(InputX,'String'));
                Y = str2double(get(InputY,'String'));
                temp = get(InputTHK,'String');
                if strcmp(temp,'')
                    thk = 0;
                else
                    thk = str2double(temp);
                end
                if isnan(Length) || Length == 0
                    error('invalid length entered')
                elseif isnan(X) || X == 0
                    error('invalid X entered')
                elseif isnan(Y) || Y == 0
                    error('invalid Y entered')
                elseif (X-(2*thk)) <= 0 || (Y-(2*thk)) <= 0
                    error('invalid thickness entered')
                end
                if isnan(thk)
                    thk = 0;
                end
                Tube = Rectangle(Length,X,Y,thk);
        end
        %% Results and Graph GUI
        notify(gui,'Compute'); %Makes loads input data into loads handle
        r = CalculateMath(loadsFig,Material,Tube);
        set(MatArea,'Units','Normalized','Position',[.333 0 .333 1]);
        GraphGUI(gui,r);
    end

end