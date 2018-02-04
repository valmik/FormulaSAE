%% Inputs
clear all


useIsotropic = 0; %Use isotropic material

if useIsotropic == 1;
matNameString = ['Aluminum 7075-T6','Aluminum 6061-T6','Aluminum 2024-T6', 'Steel 4130 Normalized','Steel 4340 Normalized'] ;
else
matrixName = 'Epoxy 3501';
fiberName =  'Boron'; %'NOGlass - E-Glass'; %'Yes Boron';%'NOAramid - Kevlar 29'; %'DragonPlate';
layupName = 'Rockwest Filament Wound';
end

failureStress = 30;
torque = 41000; %in-lb
axleLengthRange = linspace(14,17,2); %in
ODRange = linspace(2,3,2); %in
IDRange = linspace(1.75,2.75,2); %in

%% Make a material and Iterate

for 

if useIsotropic == 1
iso = Isotropic(matNameString,failureStress);
material = iso;
else
matrix = Matrix(matrixName);
fiber = Fiber(fiberName);
comp = Composite(fiber,matrix,layupName);
material = comp;
end


FoS_TB = zeros(length(axleLengthRange),length(axleLengthRange),length(axleLengthRange));

for i = 1:length(axleLengthRange)
    for j = 1:length(axleLengthRange)
        for k = 1:length(axleLengthRange)
            OD = ODRange(i);
            ID = IDRange(j);
            axleLength = axleLengthRange(k);
            
            if ID >= OD
                continue
            end
            tube = Circle(axleLength,OD,ID);
            [FoS_Torsion(i,j,k),twist(i,j,k)] = Torsion(tube,material,torque);
            FoS_TB(i,j,k) = TorsionalBuckling(tube,material,torque);
            mass(i,j,k) = MassCalc(tube,material);
        end
    end
end

FoS_TB
FoS_Torsion
twist
mass
