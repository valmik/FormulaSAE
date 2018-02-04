% Johnathan Corvello
% Axle Calcs Master Command Line
% 11/8/2015

%% Define Parameter Inputs

clear all
close all

useIsotropic = 0; %Use isotropic material

if useIsotropic == 1;
    matNameString ={'Steel 4340 Normalized'}; %{'Steel 4130 RCV''Aluminum 7075-T6','Aluminum 6061-T6','Aluminum 2024-T6', 'Steel 4130 Normalized','Steel 4340 Normalized'};
    materialSelection = length(matNameString);
else
    matrixName = {'Epoxy 3501'};
    fiberName =  {'DragonPlate'}; %'NOGlass - E-Glass'; %'Yes Boron';%'NOAramid - Kevlar 29'; %'DragonPlate';
    layupName = {'Rockwest Filament Wound'}; %JoeCalcs{'-45 45 0 45 -45'};
    materialSelection = length(fiberName);
end

B16FinalDrive = 2.41;
ChrisShockFactor = 1.7;

failureStress = 'Yield'; %268; %ksi
torque = 165*12*ChrisShockFactor*B16FinalDrive; % JoeCalcs 3100;  %in-lb

ODRange = 1.25:.25:3;
thickness = [.0625,.125,.25,.375]; % Use only for "Ideal Axle Setup"
IDRange = 2.25;
axleLengthRange = 14.2*ones(length(ODRange)); % B16 axle length

%% Ideal Axle Setup
close all
count = 0;

for m = 1:materialSelection
    
    if useIsotropic == 1
        RealMat = char(matNameString(m));
        iso = Isotropic(RealMat,failureStress(m));
        material = iso;
        
        for w = 1:length(thickness)
            thick = thickness(w);
            for k = 1:length(axleLengthRange)
                
                OD = ODRange(k);
                ID = OD - (2*thick);
                axleLength = axleLengthRange(k);
                
                tube = Circle(axleLength,OD,ID);
                [FoS_Torsion(k,w),twist(k,w)] = Torsion(tube,material,torque);
                FoS_TB(k,w) = TorsionalBuckling(tube,material,torque);
                mass(k,w) = MassCalc(tube,material);
                
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
        for w = 1:length(thickness)
            thick = thickness(w);
            for k = 1:length(axleLengthRange)
                
                OD = ODRange(k);
                ID = OD - (2*thick);
                axleLength = axleLengthRange(k);
                
                tube = Circle(axleLength,OD,ID);
                [FoS_Torsion(k,w),twist(k,w)] = Torsion(tube,material,torque);
                FoS_TB(k,w) = TorsionalBuckling(tube,material,torque);
                mass(k,w) = MassCalc(tube,material);
                
            end
            
        end
    end
end



figure(1)
for w = 1:length(thickness)
    plot(ODRange,1.7*FoS_Torsion(:,w))
    hold all
    xlabel('Outer Diameter [in]')
    ylabel('Factor of Safety - Torsion')
    title('Carbon Fiber: FoS Torsion vs OD')
    axis([1.2 3 0 12])
    if w == 4
        plot(ODRange,5*ones(length(ODRange)))
        hold all
        plot([2.5,2.5],[0,12],'--')
        plot([2.75,2.75],[0,12],'--')
    end
    legend('.0625" Thick','.125" Thick','.25" Thick','.375" Thick','FoS = 5','OD = 2.5','OD = 2.75 - Maximum OD Allowed','Location','Best')
    
end

figure(2)
for w = 1:length(thickness)
    plot(ODRange,1.7*FoS_TB(:,w))
    %axis([1.25 3 0 25])
    hold all
    xlabel('Outer Diameter [in]')
    ylabel('Factor of Safety - Torsion Buckling')
    title('Carbon Fiber: FoS Torsional Buckling vs OD')
    legend('.0625" Thick','.125" Thick','.25" Thick','.375" Thick','Location','Best')
end


figure(3)
for w = 1:length(thickness)
    plot(ODRange,mass(:,w))
    hold all
    xlabel('Outer Diameter [in]')
    ylabel('Halfshaft Mass [lbs]')
    title('Carbon Fiber: Mass of Halfshaft vs OD')
    
    if w == 4
        plot(ODRange, 1.14*ones(length(ODRange)))
    end
    legend('.0625" Thick','.125" Thick','.25" Thick','.375" Thick','Drexler Steel Halfshaft - 1.14 lbs','Location','Best')
    
end



%% Good Axle Geometries

count = 0;
for m = 1:materialSelection
    
    if useIsotropic == 1
        RealMat = char(matNameString(m));
        iso = Isotropic(RealMat,failureStress(m));
        material = iso;
        
        for k = 1:length(axleLengthRange)
            %for i = 1:length(axleLengthRange)
            %for j = 1:length(axleLengthRange)
            % COMMENT the i and j for loops while RUNNING
            % SUPPLIER SPECS and change i and j to k
            OD = ODRange(k);
            ID = IDRange(k);
            axleLength = axleLengthRange(k);
            if ID < OD
                tube = Circle(axleLength,OD,ID);
                [FoS_Torsion,twist] = Torsion(tube,material,torque);
                FoS_TB = TorsionalBuckling(tube,material,torque);
                mass = MassCalc(tube,material);
                
                
                if FoS_Torsion >= .001 && FoS_TB >= .001 && mass <= 10
                    count = count + 1;
                    GoodAxle = struct('MATERIAL',RealMat,'FoS_Torsion',FoS_Torsion,'FoS_TB',FoS_TB,'OD',OD,'ID',ID,'THICKNESS',((OD-ID)/2),'LENGTH',...
                        axleLength,'MASS',mass,'TORQUEinlbs',torque,'SHOCKFACTOR',ChrisShockFactor,'FAILUREMODE',failureStress,'TWISTdegrees',twist*180/pi)
                end
                %end
                %end
            end
        end
        
    else
        RealMatrix = char(matrixName(m));
        matrix = Matrix(RealMatrix);
        
        RealFib = char(fiberName(m));
        fiber = Fiber(RealFib);
        
        RealLay = char(layupName(m));
        
        comp = Composite(fiber,matrix,RealLay);
        material = comp;
        
        for k = 1:length(axleLengthRange)
            %for i = 1:length(axleLengthRange)
            %for j = 1:length(axleLengthRange)
            % COMMENT the i and j for loops while RUNNING
            % SUPPLIER SPECS and change i and j to k
            OD = ODRange(k); % change back to i
            ID = IDRange(k); % change back to j
            axleLength = axleLengthRange(k);
            
            if ID < OD
                tube = Circle(axleLength,OD,ID);
                [FoS_Torsion,twist] = Torsion(tube,material,torque);
                FoS_TB = TorsionalBuckling(tube,material,torque);
                mass = MassCalc(tube,material);
                
                
                if FoS_Torsion >= 3 && FoS_TB >= 4 && mass <= 2.5
                    count = count + 1;
                    GoodAxle = struct('FIBER',RealFib,'MATRIX',RealMatrix,'FoS_Torsion',FoS_Torsion,'FoS_TB',FoS_TB,'OD',OD,'ID',ID,'THICKNESS',((OD-ID)/2),'LENGTH',...
                        axleLength,'MASS',mass,'TORQUEinlbs',torque,'SHOCKFACTOR',ChrisShockFactor,'FAILUREMODE',failureStress,'TWISTdegrees',twist*180/pi)
                end
                
            end
            %end
            %end
        end
    end
end

NumberOfGoodAxles = count

%% Axle Flex Disk Flanges

% 7075 SN UNNOTCHED
% K = -1
% Mesh Size = .03" entire part
% Yield Strength: 73 ksi

% Need to make sure that the equation for SN curve does not extrapolate
% past the yield strength amplitude of the material which is eqaul to 1
% cycle

SR1 = [61.5,56,52,46,40,36.5,32,27.5,24,22,20]'; %ksi
NR1 = [2e3,5e3,1e4,3e4,1e5,3e5,1e6,4e6,1e7,4e7,1e8]';

figure()
semilogx(NR1,SR1)
hold all
xR1 = logspace(0,10,10);
AR1 = 148;
BR1= -.106;
yR1 = AR1*(2*xR1).^BR1;
plot(xR1,yR1)
legend('raw - selected points','curve fitted')
title('7075-T6 SN Curve Fit, K = -1')
xlabel('Number of Cycles')
ylabel('Stress Amplitude [ksi]')

%{
sigma_VM = (1/sqrt(2))*sqrt(((ss1-ss2).^2 + (ss2-ss3).^2 + (ss3-ss1).^2 + 6*(t12^2+t23^2+t13^2));
For the SN curve we have Tensile Loading thus,
ss1 = tensile stress, sigma_amplitude (y-axis)
ss2 = 0;
ss3 = 0;
t12 = t23 = t13 = 0;

Plugging these values into the VM equation and solving gives: ss1 = sigma_VM

StressAmplitudes are calculated below with the average of max P1 Stress from the FEAs with
the two fixed combinations: Taper or Bolts Fixed

HOWEVER, this is stress based analysis which doesn't account for strains
which can cause stresses, thus use the P1 stress

Max P1 stress, with dummy axle fixture, with plunge 500lbs per item in,in,out
%}
Yield7075 = 73;
cornerS = 26; %corner with Plunge
cornerN = ((cornerS/AR1)^(1/BR1))/2
shiftS = (44.3+30.7)/2;
shiftN = ((shiftS/AR1)^(1/BR1))/2;
shockS = 20; %50 %23.3; %%38+55.4
shockN = ((shockS/AR1)^(1/BR1))/2

N = 1.67e6
DTSpecStress7075 = AR1*(2*N)^BR1

if cornerS >= Yield7075 || shiftS >= Yield7075 || shockS >= Yield7075
    display('Above Yield Strength - VonMises Stress causes Failure')
else
    display('Below Yield Strength')
end

MinerBlock = (TotalCompCurves/cornerN) + (TotalCompZeroShocks/shockN) + (TotalCompShiftShocks/shiftN)
NumberofBlocks = 1/MinerBlock

FoS_corner = Yield7075 / cornerS
FoS_shift = Yield7075 / shiftS
FoS_shock = Yield7075 / shockS

%% OutBoard Flex Disk Flanges

% 7075 SN UNNOTCHED
% K = -1
% Mesh Size = .03" entire part
% Yield Strength: 73 ksi


SR1 = [61.5,56,52,46,40,36.5,32,27.5,24,22,20]'; %ksi
NR1 = [2e3,5e3,1e4,3e4,1e5,3e5,1e6,4e6,1e7,4e7,1e8]';

figure()
semilogx(NR1,SR1)
hold all
xR1 = logspace(0,10,10);
AR1 = 148;
BR1= -.106;
yR1 = AR1*(2*xR1).^BR1;
plot(xR1,yR1)
legend('raw - selected points','curve fitted')

%{
sigma_VM = (1/sqrt(2))*sqrt(((ss1-ss2).^2 + (ss2-ss3).^2 + (ss3-ss1).^2 + 6*(t12^2+t23^2+t13^2));
For the SN curve we have Tensile Loading thus,
ss1 = tensile stress, sigma_amplitude (y-axis)
ss2 = 0;
ss3 = 0;
t12 = t23 = t13 = 0;

Plugging these values into the VM equation and solving gives: ss1 = sigma_VM

StressAmplitudes are calculated below with the max P1 Stress from the FEAs with
the two fixed combinations: Bolts Fixed

HOWEVER, this is stress based analysis which doesn't account for strains
which can cause stresses, thus use the P1 stress
%}
Yield7075 = 73;
cornerS = (20.1)/2;
cornerN = ((cornerS/AR1)^(1/BR1))/2
shiftS = (20.7)/2;
shiftN = ((shiftS/AR1)^(1/BR1))/2;
shockS = 30;
shockN = ((shockS/AR1)^(1/BR1))/2


if cornerS >= Yield7075 || shiftS >= Yield7075 || shockS >= Yield7075
    display('Above Yield Strength - VonMises Stress causes Failure')
else
    display('Below Yield Strength')
end

MinerBlock = (TotalCompCurves/cornerN) + (TotalCompZeroShocks/shockN) + (TotalCompShiftShocks/shiftN)
NumberofBlocks = 1/MinerBlock

FoS_corner = Yield7075 / cornerS
FoS_shift = Yield7075 / shiftS
FoS_shock = Yield7075 / shockS


%% 2024 T3 SN Data UNNOTCHED
% https://icme.hpc.msstate.edu/mediawiki/index.php/File:Student10_Spring2015_ICME_Data_Figure14.png
% http://www.matweb.com/search/DataSheet.aspx?MatGUID=781ce4adb30c4d548320b0ab262a5d28
close all
Yield_2024 = 50; % ksi
% Assuming R = -1 for corner loading cases with accell and braking
% For shock and shift loadings which are really R = 0

SR1 = [55,50,45,40,33.5,30,26,23,20,18]';
NR1 = [3e3,1e4,2e4,4e4,1e5,2e5,5e5,1e6,3e6,8e6]';

SR0 = [68,60,51.5,46,40,35]';
NR0 = [2e4,4e4,1e5,2e5,4e5,1e6]';

% Logger Pro Curve Fit

xR1 = logspace(3,10,10);
AR1 = 211;
BR1 = -.15;
yR1 = AR1*(2*xR1).^BR1;


xR0 = logspace(3,10,10);
AR0 = 418;
BR0 = -.172;
yR0 = AR0*(2*xR0).^BR0;

figure()
semilogx(NR0,SR0)
hold all
semilogx(xR0,yR0)
semilogx(NR1,SR1)
semilogx(xR1,yR1)
title('AL 2024 - T3')
legend('R0 Raw','R0 Curve Fitted','R-1 Raw','R-1 Curve Fitted')

% ALTERNATIVELY USING YIELD STRENGTH LIMITING FACTOR TO FIND RegStressAMP

shockS = 15*sqrt(3); %Yield_2024; % Do Not divide by sqrt(3) yet since these rely on curve fitted line
cornerS = shockS/ChrisShockFactor;
shiftS = cornerS*ShiftKnockdown;

cornerN = ((cornerS/AR1)^(1/BR1))/2 % R = -1
shockN = ((shockS/AR0)^(1/BR0))/2 % R = 0
shiftN = ((shiftS/AR0)^(1/BR0))/2 % R = 0

MinerBlock = (TotalCompCurves/cornerN) + (TotalCompZeroShocks/shockN) + (TotalCompShiftShocks/shiftN)

AllowedBlocks = 1/MinerBlock
%FoSShockKnockDown = .4; % Use 1.4
%ShockShearStressAmp2024 = shockS*FoSShockKnockDown/sqrt(3) % Use limiting case for yield which is Shock Shear Stress
% Divide By sqrt(3) to convert tensile to shear since sigma = sqrt(3)*tau

%{
ODCalcRange = 2:.25:3;

for j = 1:length(ODCalcRange)
OD = ODCalcRange(j);
r_outer = (OD/2); %in

r_inner = (r_outer^4 - ((T_shock*r_outer)/((pi/2)*ShockShearStressAmp2024*1000)))^(1/4); % Use T_curve
IDCalcRange(j) = 2*r_inner;
end
IDCalcRange

% A check on whether the OD/ID make sense
for q = 1:length(ODCalcRange)
OD = ODCalcRange(q);
ID = IDCalcRange(q);

r_out = (OD/2); %in
r_in = (ID/2); %in

J  = (pi/2)*(r_out^4 - r_in^4);

ShearStressAxleAmp = T_shock*r_out/J; %Used T_curve
QuickFoS(q) = Yield_2024/(sqrt(3)*(ShearStressAxleAmp/1000));
end

QuickFoS
%}


%% 4340 Hardenend kt=1 SN Data UNNOTCHED

% 4340 SN kt = 1
% K = -1
% Mesh Size = .03" entire part
% Yield Strength: 102 ksi

% Need to make sure that the equation for SN curve does not extrapolate
% past the yield strength amplitude of the material which is eqaul to 1
% cycle

SR1 = [107,95,85,78,73]' %ksi
NR1 = [7e4,2e5,6e5,2e6,6e6]'

figure()
semilogx(NR1,SR1)
hold all
xR1 = logspace(0,10,10);
AR1 = 299;
BR1= -.088;
yR1 = AR1*(2*xR1).^BR1;
plot(xR1,yR1)
legend('raw - selected points','curve fitted')
title('7075-T6 SN Curve Fit, K = -1')
xlabel('Number of Cycles')
ylabel('Stress Amplitude [ksi]')
%{
sigma_VM = (1/sqrt(2))*sqrt(((ss1-ss2).^2 + (ss2-ss3).^2 + (ss3-ss1).^2 + 6*(t12^2+t23^2+t13^2));
For the SN curve we have Tensile Loading thus,
ss1 = tensile stress, sigma_amplitude (y-axis)
ss2 = 0;
ss3 = 0;
t12 = t23 = t13 = 0;

Plugging these values into the VM equation and solving gives: ss1 = sigma_VM

StressAmplitudes are calculated below with the average of max P1 Stress from the FEAs with
the two fixed combinations: Taper or Bolts Fixed

HOWEVER, this is stress based analysis which doesn't account for strains
which can cause stresses, thus use the P1 stress

Max P1 stress, with dummy axle fixture, with plunge 500lbs per item in,in,out
%}
Yield4340 = 102;
cornerS = 26; %corner with Plunge
cornerN = ((cornerS/AR1)^(1/BR1))/2
shiftS = (44.3+30.7)/2;
shiftN = ((shiftS/AR1)^(1/BR1))/2;
shockS = 74.8; % SHOCK WITH PLUNGE
shockN = ((shockS/AR1)^(1/BR1))/2

N = 1.67e6
DTSpecStress7075 = AR1*(2*N)^BR1

if cornerS >= Yield4340 || shiftS >= Yield4340 || shockS >= Yield4340
    display('Above Yield Strength - VonMises Stress causes Failure')
else
    display('Below Yield Strength')
end

MinerBlock = (TotalCompCurves/cornerN) + (TotalCompZeroShocks/shockN) + (TotalCompShiftShocks/shiftN)
NumberofBlocks = 1/MinerBlock

FoS_corner = Yield4340 / cornerS
FoS_shift = Yield4340 / shiftS
FoS_shock = Yield4340 / shockS


%% A-Wellen Zusammenbau Deckelseite pdf Weights OTS
%kg

a = .513; %16
b = .003; %15
c = .518; %14 shaft
d = .005; %13
e1 = .012*2; %12
f = .222*2; %11 tripods
g = .134*2; %10
h = .026*2; %9
i = .002*4; %7,8
j = .010; %6
k = .012+.014; %4

% Is included in diff assembly
l = .656; %Output Flange
m = .606; %Output Flange
n = .556; %Output Flange

OTS_Drexler_kg_ONESIDE = a+b+c+d+e1+f+g+h+i+j+k;

OTS_Drexler_lbs_ONESIDE = convmass(OTS_Drexler_kg_ONESIDE, 'kg','lbm')
OTS_Drexler_lbs_BothSides = 2*OTS_Drexler_lbs_ONESIDE

DrexlerHalfShaft = convmass(c, 'kg','lbm')
