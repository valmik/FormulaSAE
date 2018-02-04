classdef Rectangle < Tube
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function tube = Rectangle(length,x,y,thk)
            %we are assuming x is the base and y is height
            if nargin == 3 %if solid tube
                ix = 0;
                iy = 0;
                if x > y
                    tube.thk = y./2;
                else
                    tube.thk = x./2;
                end
                OD = 2.*sqrt(0.25*(x.^2+y.^2));
                tube.avgD = OD./2;
            else
                if thk == 0
                    ix = 0;
                    iy = 0;
                else
                    ix = x-(2.*thk);
                    iy = y-(2.*thk);
                end
                tube.thk = thk;
                if x > y
                    ID = y./2;
                else
                    ID = x./2;
                end
                OD = 2*sqrt(0.25*(x.^2+y.^2));
                tube.avgD = (OD+ID) ./ 2;
            end
            tube.Length = length;
            if x > y
                tube.R = x./2;
            else
                tube.R = y./2;
            end
            tube.CS = (x.*y) - (ix.*iy);
            %http://www.engineeringtoolbox.com/area-moment-inertia-d_1328.html
            tube.I = ((x.*y.^3) - (ix.*iy.^3)) / 12;
            %http://www.engineersedge.com/material_science/section_modulus_12893.htm
            tube.Z = (x.*y.^2 / 6) - ((ix.*iy.^3) / (6.*y));
            %http://en.wikipedia.org/wiki/Polar_moment_of_inertia
            %calculate using the general equation
            %our setup was a double integral going from [x/2 to -x/2] and
            %[y/2 to -y/2] of the integral (x^2+y^2)dxdy
            tube.J = ((x.^3.*y + x.*y.^3) ./ 12) - ((ix.^3.*iy + ix.*iy.^3) ./ 12);
        end
        
    end
end

