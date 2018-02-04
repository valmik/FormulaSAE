%% Inputs
clear all

useIsotropic = 1; %Use isotropic material

if useIsotropic == 1;
matNameString = 'Aluminum 2024-T6';
else
matrixName = 'Epoxy 3501';
fiberName = 'DragonPlate';
layupName = 'Rockwest Filament Wound';
end

failureStress = 30;
torque = 41000; %in-lb
axleLength = 16; %in
OD = 2.75; %in
ID = 2; %in

%% Make a material
if useIsotropic == 1
iso = Isotropic(matNameString,failureStress);
material = iso;
else
matrix = Matrix(matrixName);
fiber = Fiber(fiberName);
comp = Composite(fiber,matrix,layupName);
material = comp;
end

%% Make Tube
tube = Circle(axleLength,OD,ID);

%% Calculate
[FoS_Torsion,twist] = Torsion(tube,material,torque);
FoS_TB = TorsionalBuckling(tube,material,torque)