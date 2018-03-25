% BondLength * pi*D * BondStrength * BondPercent = Capability = FOS*Force
% Force = Torque / (D/2)


EngineTorque = 165*12; % in-lbs
ShockFactor = 1.3;
FinalDrive = 3.3;
FOS_Des = 10; 
Diameter = [2.625]; %in
BondStrength = 4000; %psi
BondPercent = 1;

Torque = EngineTorque*FinalDrive*ShockFactor;

Force = Torque*2./Diameter; % lb
CapabilityNeeded = Force*FOS_Des;
BondLengthNeeded = CapabilityNeeded./(BondPercent*BondStrength*Diameter*pi)









