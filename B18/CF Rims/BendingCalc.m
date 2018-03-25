% I want to measure the ratio of deflection in carbon vs steel rims
% Deflection is: l^3 * F / (3 * E * MOI)
% B_Cf : B_Al is (E_Al * MOI_Al)/(E_Cf * MOI_Cf)
% MOI is: pi * (OD^4 - ID^4)/64
% Units don't matter as long as they're the same

OD = 9.85;
T_Al = 0.125;
T_Cf = 0.108;
ID_Al = OD - 2*T_Al;
ID_Cf = OD - 2*T_Cf;
MOI_Al = pi * (OD^4 - ID_Al^4) / 64;
MOI_Cf = pi * (OD^4 - ID_Cf^4) / 64;

E_Al = 73;
E_Cf = 45;

Ratio = (E_Al * MOI_Al)/(E_Cf * MOI_Cf)



