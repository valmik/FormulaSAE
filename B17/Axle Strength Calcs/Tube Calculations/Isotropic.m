classdef Isotropic < Material
    %This class stores material data for an isotropic material
    %   Detailed explanation goes here

    properties
        Ultimate; %Ultimate Strength in ksi
        Yield; % Yield Strength in ksi
        Reference; % A URL with a datasheet
    end
    
    methods
        
        function iso = Isotropic(matNameString,failure)
            if nargin < 1
                error('Not enough inputs')
            elseif isa(matNameString,'char')
                % Create material from string in subfunction
                iso = importProperties(iso,matNameString);
                iso.Name=matNameString;
                
                % Deal with custom failure spec entered
                if nargin == 2
                    % Deal with string input
                    if isa(failure,'char')
                        % If empty use yield
                        if isempty(failure) || strcmp(failure,'Yield')
                            iso.Failure = iso.Yield;
                        else %If enter ultimate or something else
                            iso.Failure = iso.Ultimate;
                        end
                        
                    elseif isa(failure,'double')
                        % If there is a number input set it to that
                        iso.Failure=failure*1000;
                    end
                else % If string not passed
                    iso.Failure = iso.Yield;
                end
            else
                error('Invalid inputs')
            end
        end
        
        function openReference(iso)
            if strcmp(iso.Reference,'None')
                display('No reference available')
            elseif strfind(iso.Reference,'www')
                web(iso.Reference);
            else
                display(iso.Reference)
            end
        end
       
    end
    methods (Access = private)
        function iso = importProperties(iso,matNameString)
            % Concatenate fileName
            fileName=['./Materials/Isotropic/',matNameString,'.txt'];
            % Open file
            fileID = fopen(fileName);
            % This is how the data is organized in the txt file
            formatSpec = '%*s Density=%f Ultimate=%f Yield=%f E=%f Poisson=%f ShearModulus=%f Reference: %s';
            % Take the data and ouput it as a string
            fileData = textscan(fileID,formatSpec,...
                'Delimiter', '\n');
            % Close the file to unlock it and remove the file from memory
            fclose(fileID);
            
            % Add the data into our properties
            iso.Rho=fileData{1};
            iso.Ultimate=fileData{2}*1000;
            iso.Yield=fileData{3}*1000;
            iso.E1=fileData{4}*1000;
            iso.E2=fileData{4}*1000;
            iso.Nu=fileData{5};
            iso.G=fileData{6}*1000;
            iso.Reference=fileData{7}{1};
        end 
    end
end


