classdef (Abstract) Tube
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    properties
    end
    properties (Access = protected)
        I %Moment of Inertia
        Z %section modulus of the cross-section of the beam
        J %Polar moment of Inertia
        R %Max radius. For cirlces = OD/2. For rect = half of max dimention
        CS %Cross sectional area
        Length
        thk %wall thickness
        avgD %average diameter
    end
    
    methods
        function mass = MassCalc(Tube,Material)
            mass = Tube.CS*Tube.Length*Material.Rho;
        end
        
        function [FoS,deflection] = SimpleSupportBeam(Tube,Material,load)
            %Assume fixed on both ends and load is applyed to the middle of the
            %tube
            %Source: http://www.engineersedge.com/beam_bending/beam_bending2e.htm
            stress = (load.*Tube.Length) / (2.*Tube.Z);
            strain = stress ./ Material.E2;
            switch class(Material)
                case 'Isotropic'
                    FoS = Material.Failure ./ stress;
                case 'Composite'
                    FoS = Material.Failure ./ strain;
            end
            deflection = (load.*Tube.Length.^3) ./ (48.*Material.E2.*Tube.I);
        end
        
        function [FoS,deflection] = CantileveredBeam(Tube,Material,load)
            %Assume fixed on one end and load applied to other end
            %Source: http://www.engineersedge.com/beam_bending/beam_bending9.htm
            stress = (load.*Tube.Length) ./ Tube.Z;
            strain = stress ./ Material.E2;
            FoS = Material.Failure ./ stress;
            switch class(Material)
                case 'Isotropic'
                    FoS = Material.Failure ./ stress;
                case 'Composite'
                    FoS = Material.Failure ./ strain;
            end
            deflection = (load.*Tube.Length.^3) ./ (3.*Material.E2.*Tube.I);
        end
        
        function FoS = Buckling(Tube,Material,load,n)
            %Source:http://www.engineeringtoolbox.com/euler-column-formula-d_1813.html
            if nargin == 3
                n = 1; %This means the column can pivot at both ends
            end
            Force = (n.*pi.^2.*Material.E1.*Tube.I) ./ Tube.Length.^2;
            FoS = Force ./ load;
        end
        
        function FoS = CompressiveFailure(Tube,Material,load)
            %Basic definition of stress
            stress = load ./ Tube.CS;
            switch class(Material)
                case 'Isotropic'
                    FoS = Material.Failure ./ stress;
                case 'Composite'
                    %The paper Buixansky, B., Fleck, N. - Compressive Failure of Fibre Composites
                    %claims that the shear modulus of a
                    %composite tube is a rough estimate of the compressive
                    %failure point
                    FoS = Material.G ./ stress;
            end
        end
        
        function [FoS,twist] = Torsion(Tube,Material,Moment)
            %Twist is the Torsional Deflection of Shaft in radians
            %stress will be in shear stress
            %Source: http://www.engineeringtoolbox.com/torsion-shafts-d_947.html
            stress = Moment.*Tube.R ./ Tube.J;
            twist = (Moment.*Tube.Length) ./ (Tube.J.*Material.G);
            strain = stress ./ (Material.G); %%%%% Check if sqrt(3) in num here this since Composites
            switch class(Material)
                case 'Isotropic'
                    FoS = Material.Failure ./ (sqrt(3)*stress); %%% SQRT(3) was missing here, were comparing tensile yeild to shear yeild, JPC
                case 'Composite'
                    FoS1 = Material.Failure ./ strain; %Divide ultimate tension strain by shear strain
                    FoS2 = .013./strain; %From Joe paper/Dharan reader. Gamma_12u
                    FoS = min(FoS1,FoS2);
            end
        end
        
        function FoS = TorsionalBuckling(Tube,Material,Torque)
            %This equation comes from the paper Shear Buckling of a
            %composite drive shaft under torsion EQ 2. 
            %EQ2 was shown to be more accurare than EQ1
            %The file name is Shokrieh, M., Hasani A., Lessard, L., - Shear Buckling of a Composite Drive Shaft
            %This equation was emirically derived from testing composite
            %shafts
            %Calculations for rectangles will be complete "shit of ze bull"
            %We do not see a use scenerio where you need this for rectangles
            %anyways
            CalcTorque = 1.854./sqrt(Tube.Length).*(Material.E1).^.375.*...
                (Material.E2).^0.625.*Tube.thk.^2.25.*Tube.avgD.^1.25;
            FoS = CalcTorque ./ Torque;
        end
    end
end