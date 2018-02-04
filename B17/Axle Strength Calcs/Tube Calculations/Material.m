classdef (Abstract) Material
    % Material holds material properties for use in the calculators.
    %   Detailed explanation goes here
    
    properties
        E1; %Axial Elastic Modulus of Material in ksi
        E2; %Transverse Elastic Modulus of Material in ksi
        Rho; %Density
        Nu; %Poisson's ratio
        Name; %String with material name
        %Ultimate; %Ultimate Strength in ksi
        %Yield; % Yield Strength in ksi
        Failure; %The comparison stress point for all factors of safety
        G; % Shear Modulus in ksi
    end
    
    
end

