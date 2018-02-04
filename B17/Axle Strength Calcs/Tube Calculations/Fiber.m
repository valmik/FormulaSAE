classdef Fiber
    %This class stores and import fiber properties.
    %   Detailed explanation goes here
    
    properties
        E1;
        E2;
        Nu12;
        Nu23;
        Rho;
        Ultimate;
        FAW; %Fiber areal weight
        G12;
        G23;
        Reference
    end
    
    methods
        function fiber = Fiber(fiberName)
            fiber=fiber.importProperties(fiberName);
            
            fiber.G12=fiber.E1/(2*(1+fiber.Nu12));
            fiber.G23=fiber.E2/(2*(1+fiber.Nu23));
            
            
        end
        
            function openReference(fiber)
            if strcmp(fiber.Reference,'None')
                display('No reference available')               
            elseif strfind(fiber.Reference,'www')
                web(fiber.Reference);                
            else
                display(fiber.Reference)
            end
        end
    end
    methods (Access = private)
        function fiber = importProperties(fiber,matNameString)
            % Concatenate fileName
            fileName=['./Materials/Fibers/',matNameString,'.txt'];
            % Open file
            fileID = fopen(fileName);
            % This is how the data is organized in the txt file
            formatSpec = '%*s E1=%f E2=%f Poisson12=%f Poisson23=%f Density=%f Ultimate=%f FAW=%f Reference: %s';
            % Take the data and ouput it as a string
            fileData = textscan(fileID,formatSpec,...
                'Delimiter', '\n');
            % Close the file to unlock it and remove the file from memory
            fclose(fileID);
            % Add the data into our properties in Pa
            fiber.E1 = fileData{1}*10^6;
            fiber.E2 = fileData{2}*10^6;
            fiber.Nu12 = fileData{3};
            fiber.Nu23 = fileData{4};
            fiber.Rho = fileData{5};
            fiber.Ultimate = fileData{6}*10^6;
            fiber.FAW = fileData{7};
            fiber.Reference=fileData{8}{1};
        end
    end
end

