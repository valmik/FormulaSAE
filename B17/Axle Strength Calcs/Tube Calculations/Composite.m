classdef Composite < Material
    %Creates a composite material out of multiple materials
    %   Detailed explanation goes here
    
      
    properties(Access = private)
        Fiber
        Matrix
        WRF=0.05; %Weave reduction factor typically 5-15%
        Mm=.5; % Matrix Mass Fraction
        Vv=.01; % Void fraction 0.5%-2% is typical
        Vf; %Fiber Volume;
        Vm; %Matrix Volume;
        CPT_estimate; %Cured ply thickness
        Layup; %An array of angles
    end
    
    methods
        function comp = Composite(fiber,matrix,layupName,Mm,Vv,WRF)
            %Takes in a Fiber object, Matrix object, Name of layup file, Matrix Mass Factrion, and
            %Void Faction
            %If you don't enter these values it will use defaults above.
            
            %Check if inputted fiber and matrix
            if nargin < 2
                error('Not enough inputs')
            else
                comp.Name='Composite';
                comp.Fiber=fiber;
                comp.Matrix=matrix;
                comp = comp.setLayup(layupName);
                %Did they input their own Mm and Vv
                if nargin == 6
                    comp.Mm=Mm;
                    comp.Vv=Vv;
                    comp.WRF=WRF;
                end
            end
            %Calculate the volume fractions and ply thickness
            comp=densVol(comp);
            %Calculate the estimated layup material data
            comp=laminaProp(comp);
             %Strain to failure is ultimate tension strength of
            %fiber/tensile modulus
            comp.Failure = comp.Fiber.Ultimate/comp.Fiber.E1;
            %Convert properties accessed by other classes to US units
            comp=convertSItoUS(comp);
        end
    end
    methods (Access = private)
        function comp = setLayup(comp,layupName)
          % Concatenate fileName
            fileName=['./Materials/Layups/',layupName,'.txt'];
            % Open file
            fileID = fopen(fileName);
            % This is how the data is organized in the txt file
            formatSpec = '%s';
            % Take the data and ouput it as a string
            fileData = textscan(fileID,formatSpec,...
                'Delimiter', '\n');
            % Close the file to unlock it and remove the file from memory
            fclose(fileID);
            
            % Add the data into our properties
            layupString = fileData{1};
            
            comp.Layup = str2num(layupString{1});    
        end
                function comp = densVol(comp)
            %Calculate the volume fraction of the fibers
            comp.Vf = (1-comp.Vv) / (1+(comp.Fiber.Rho/comp.Matrix.Rho)*(comp.Mm/(1-comp.Mm)));
            %Calculate the volume fraction of the matrix
            comp.Vm = 1-comp.Vf-comp.Vv;
            %Calculate the cured ply thickness
            comp.CPT_estimate = comp.Fiber.FAW/(comp.Fiber.Rho*comp.Vf);
        end
        function comp = laminaProp(comp)
            %% Simplify variables
            E1f=comp.Fiber.E1;
            E2f=comp.Fiber.E2;
            G12f=comp.Fiber.G12;
            G23f=comp.Fiber.G23;
            Gm=comp.Matrix.G;
            Em = comp.Matrix.E;
            Vf=comp.Vf;
            Vm=comp.Vm;
            Rhof=comp.Fiber.Rho;
            Rhom=comp.Matrix.Rho;
            Nu12f = comp.Fiber.Nu12; %JC 11/30/2015
            Num = comp.Matrix.Nu; %JC 11/30/2015
            
            %% Calculate lamina properties (Kollar and Springer/Joe's Guide)
            E11 = (1-comp.WRF )*((E1f*comp.Vf)+(Em*comp.Vm));
            E22 = 1/( (sqrt(Vf)/(E2f*sqrt(Vf)+Em*(1-sqrt(Vf)) )) + ((1-sqrt(Vf))/Em));
            E33=E22;
            G12 = 1/( (sqrt(Vf)/(G12f*sqrt(Vf)+Gm*(1-sqrt(Vf)) )) + ((1-sqrt(Vf))/Gm));
            G23 = 1/( (sqrt(Vf)/(G23f*sqrt(Vf)+Gm*(1-sqrt(Vf)) )) + ((1-sqrt(Vf))/Gm));
            G13=G12;
            %% Calculate Poisson Ratio
            %Nu12=E22/(2*G23)-1;
            Nu12 = Nu12f*Vf + Num*Vm;  %JC 11/30/2015
            %Nu12=Nu12; %JC 11/30/2015
            %% Calculate density
            comp.Rho = Rhof*Vf+Rhom*Vm;
            
            %% Approximations of In-Plane Properties
            p=(1-(((Nu12^2)*E22)/E11))^-1;
            Q11=p*E11;
            Q22=p*E22;
            Q66=G12;
            Q12=p*Nu12*E22;
            
            %% Use layup information to determine in plane properties           
            
            % Take cos/sin of the layup angles for later
            theta=comp.Layup;
            a=cosd(theta);
            b=sind(theta);
            %Set up our Qbar matrices, 6 are calculated for every layer
            Qbar11_step=zeros(1,length(a));
            Qbar22_step=zeros(1,length(a));
            Qbar12_step=zeros(1,length(a));
            Qbar66_step=zeros(1,length(a));
            Qbar16_step=zeros(1,length(a));
            Qbar26_step=zeros(1,length(a));
            
            %Fill in the Qbar matrix in every layer
            for kk=1:length(a);
                Qbar11_step(kk)=(a(kk)^4*Q11+b(kk)^4*Q22+2*a(kk)^2*b(kk)^2*Q12+a(kk)^2*b(kk)^2*4*Q66);
                Qbar22_step(kk)=(b(kk)^4*Q11+a(kk)^4*Q22+2*a(kk)^2*b(kk)^2*Q12+a(kk)^2*b(kk)^2*4*Q66);
                Qbar12_step(kk)=(a(kk)^2*b(kk)^2*Q11+a(kk)^2*b(kk)^2*Q22+(a(kk)^4+b(kk)^4)*Q12-a(kk)^2*b(kk)^2*(4*Q66));
                Qbar66_step(kk)=(4*a(kk)^2*b(kk)^2*Q11+4*a(kk)^2*b(kk)^2*Q22-8*a(kk)^2*b(kk)^2*Q12+(a(kk)^2-b(kk)^2)^2*(4*Q66))*.25;
                Qbar16_step(kk)=(2*a(kk)^3*b(kk)*Q11-2*a(kk)*b(kk)^3*Q22-2*(a(kk)^3*b(kk)-a(kk)*b(kk)^3)*Q12-(a(kk)^3*b(kk)-a(kk)*b(kk)^3)*(4*Q66))*.5;
                Qbar26_step(kk)=(2*a(kk)*b(kk)^3*Q11-2*a(kk)^3*b(kk)*Q22+2*(a(kk)^3*b(kk)-a(kk)*b(kk)^3)*Q12+(a(kk)^3*b(kk)-a(kk)*b(kk)^3)*(4*Q66))*.5;
            end
            
            %Sum the Qbar compents into our final Qbar matrices
            Qbar11=sum(Qbar11_step);
            Qbar22=sum(Qbar22_step);
            Qbar12=sum(Qbar12_step);
            Qbar66=sum(Qbar66_step);
            Qbar16=sum(Qbar16_step);
            Qbar26=sum(Qbar26_step);
            
            
            A_t11=sum(Qbar11)/length(theta);
            A_t22=sum(Qbar22)/length(theta);
            A_t12=sum(Qbar12)/length(theta);
            A_t66=sum(Qbar66)/length(theta);
            
            delta=A_t11*A_t22-A_t12^2;
            
            
            comp.E1=delta/A_t22;
            comp.E2=delta/A_t11;
            comp.Nu=A_t12/A_t22; %Nu12
            comp.G=A_t66;
        end
        function comp=convertSItoUS(comp)
        % Convert all units from Pa to psi and kg/m^3 to lb/in^3
        comp.Failure=comp.Failure;
        comp.E1=comp.E1/6874.8;
        comp.E2=comp.E2/6874.8;
        comp.G=comp.G/6874.8;
        comp.Rho=comp.Rho*3.613*10^-5;   
        end
    end

end