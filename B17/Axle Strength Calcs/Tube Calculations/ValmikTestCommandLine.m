% Valmik Prabhu
% Axle Calcs Master Command Line
% 11/8/2016

%% User-defined constants

clear all 
close all


B18FinalDrive = 37/12;
ChrisShockFactor = 1.3;

% Minimum FOS's
MinTorsion = 3; %2 for iso, 3 for carbon
MinTB = 5; %3 for iso, 5 for carbon


%% Define Parameter Inputs

useIsotropic = 0; %Use isotropic material (or carbon fiber)

if useIsotropic == 1;
    matNameString = {'Aluminum 7075-T6','Aluminum 6061-T6','Aluminum 2024-T6', 'Steel 4130 Normalized', 'Steel 4130 480C HT', 'Steel 4130 RCV', 'Steel 4340 Normalized', 'Steel 4340 230C HT', 'Steel 4340 540C HT', 'Steel - 300M'};
    materialSelection = length(matNameString);
else
    matrixName = {'Epoxy 3501'};
    fiberName =  {'DragonPlate'}; %'NOGlass - E-Glass'; %'Yes Boron';%'NOAramid - Kevlar 29'; %'DragonPlate';
    layupName = {'TestWound'}; %JoeCalcs{'-45 45 0 45 -45'};
    materialSelection = length(fiberName);
end


failureStress = 'Yield'; %268; %ksi
torque = 165*12*ChrisShockFactor*B18FinalDrive; % JoeCalcs 3100;  %in-lb

ODRange = 2.7:0.01:2.9;
thickness = 0.1325; %0.06:.01:0.16;% [.0625, .125]; % Use only for "Ideal Axle Setup"
axleLength = 14.25; % B16 axle length


%torque = torque*(165+10)/165; % +/- ft-lbs range effect on FoS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% OD [2.25,2.5,1.25,2.375,2.5,2.625,2.75]; %[2.5]; %.8; %ODCalcRange; %[2.25,2.5,1.25,2.375,2.5,2.625,2.75];
% ID %[2,2.25,1,2.25,2.375,2.5,2.625]; %[2.37];%.5; %IDCalcRange; %[2,2.25,1,2.25,2.375,2.5,2.625];
%JoesCalcs[18,18,18];
%ROCKWEST1.5:.125:3; %JoesCalcs[1.5,2,3];                            %IsoCalcs ODCalcRange;    % linspace(.5,2.75,100); %in
%ROCKWEST1.5:.125:3;      % JoesCalcs[1.5-(2*.04),2-(2*.045),3-(2*.085)]; %IsoCalcs IDCalcRange;    % linspace(.5,2.75,100); %in

% Composite Axle Choice
% 1) 2.5 OD, 2.25 ID http://www.rockwestcomposites.com/products/35017

%% Ideal Axle Setup
close all
count = 0;
minweight = 1000;
for m = 1:materialSelection
    flag = 0;
    
    if useIsotropic == 1
        RealMat = char(matNameString(m));
        iso = Isotropic(RealMat,failureStress);
        material = iso;
        
        for j = 1:length(thickness)
            if flag == 1
                break;
            end
            for i = 1:length(ODRange)
                %for i = 1:length(axleLengthRange)
                %for j = 1:length(axleLengthRange)
                % COMMENT the i and j for loops while RUNNING
                % SUPPLIER SPECS and change i and j to k
                if flag == 1
                    break;
                end
                
                OD = ODRange(i);
                ID = OD - 2*thickness(j);
                axleLength = axleLength;
                if ID < OD
                    tube = Circle(axleLength,OD,ID);
                    [FoS_Torsion,twist] = Torsion(tube,material,torque);
                    FoS_TB = TorsionalBuckling(tube,material,torque);
                    mass = MassCalc(tube,material);


                    if FoS_Torsion >= MinTorsion && FoS_TB >= MinTB && mass <= 10
                        count = count + 1;
                        GoodAxle = struct('MATERIAL',RealMat,'FoS_Torsion',FoS_Torsion,'FoS_TB',FoS_TB,'OD',OD,'ID',ID,'THICKNESS',((OD-ID)/2),'LENGTH',...
                            axleLength,'MASS',mass,'TORQUEinlbs',torque,'SHOCKFACTOR',ChrisShockFactor,'FAILUREMODE',failureStress,'TWISTdegrees',twist*180/pi)
                        flag = 1;
                    end
                    %end
                    %end
                end
            end
        end
        
    else %%%%%%%%%%%%%%%%%%%%%%%%
        RealMatrix = char(matrixName(m));
        matrix = Matrix(RealMatrix);
        
        RealFib = char(fiberName(m));
        fiber = Fiber(RealFib);
        
        RealLay = char(layupName(m));
        
        comp = Composite(fiber,matrix,RealLay);
        material = comp;
        for j = 1:length(thickness)
            if flag == 1
                break;
            end
            for i = 1:length(ODRange)
                if flag == 1
                    break;
                end

                OD = ODRange(i);
                ID = OD - 2*thickness(j);
                axleLength = axleLength;
                
                tube = Circle(axleLength,OD,ID);
                [FoS_Torsion,twist] = Torsion(tube,material,torque);
                FoS_TB = TorsionalBuckling(tube,material,torque);
                mass = MassCalc(tube,material);
                
                
                 if FoS_Torsion >= MinTorsion && FoS_TB >= MinTB && mass <= 2 %&& OD < 3
                    count = count + 1;
                    GoodAxle = struct('FIBER',RealFib,'MATRIX',RealMatrix,'FoS_Torsion',FoS_Torsion,'FoS_TB',FoS_TB,'OD',OD,'ID',ID,'THICKNESS',((OD-ID)/2),'LENGTH',...
                        axleLength,'MASS',mass,'TORQUEinlbs',torque,'SHOCKFACTOR',ChrisShockFactor,'FAILUREMODE',failureStress,'TWISTdegrees',twist*180/pi)
%                     flag = 1;
                    if mass < minweight
                        minweight = mass;
                        mingood = GoodAxle;
                    end
                end
  
            end
            
        end
    end
end
  