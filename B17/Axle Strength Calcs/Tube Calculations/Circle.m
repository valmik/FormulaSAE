classdef Circle < Tube
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function tube = Circle(axleLength,OD,ID)
            tube.Length = axleLength;
            tube.R = OD ./ 2;
            if nargin == 2 %if solid tube
                ID = 0;
            end
            %http://www.engineeringtoolbox.com/area-moment-inertia-d_1328.html
            tube.I = pi*(OD.^4-ID.^4) ./ 64;
            %http://www.engineersedge.com/material_science/section_modulus_12893.htm
            tube.Z = pi*(OD.^4-ID.^4) ./ (32*OD);
            %http://www.engineeringtoolbox.com/torsion-shafts-d_947.html
            tube.J = pi*(OD.^4-ID.^4) ./ 32;
            tube.CS = 0.25.*pi.*(OD.^2-ID.^2);
            tube.thk = (OD-ID) ./ 2;
            tube.avgD = (OD+ID) ./ 2;
        end     
    end    
end