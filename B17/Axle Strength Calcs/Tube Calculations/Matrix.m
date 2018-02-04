classdef Matrix
    %This class stores and import matrix properties.
    %   Detailed explanation goes here
    
    properties
        E;
        Nu;
        Rho;
        Ultimate;
        G;
        Reference;
    end
    
    methods
        function matrix = Matrix(matrixName)
            matrix=matrix.importProperties(matrixName);
            
            matrix.G=matrix.E/(2*(1+matrix.Nu));
            
        end
        
        function openReference(matrix)
            if strcmp(matrix.Reference,'None')
                display('No reference available')               
            elseif strfind(matrix.Reference,'www')
                web(matrix.Reference);                
            else
                display(matrix.Reference)
            end
        end
        
    end
    methods (Access = private)
        function matrix = importProperties(matrix,matNameString)
            % Concatenate fileName
            fileName=['./Materials/Matrix/',matNameString,'.txt'];
            % Open file
            fileID = fopen(fileName);
            % This is how the data is organized in the txt file
            formatSpec = '%*s E=%f Poisson=%f Density=%f Ultimate=%f Reference: %s';
            % Take the data and ouput it as a string
            fileData = textscan(fileID,formatSpec,...
                'Delimiter', '\n');
            % Close the file to unlock it and remove the file from memory
            fclose(fileID);
            % Add the data into our properties in Pa
            matrix.E = fileData{1}*10^6;
            matrix.Nu = fileData{2};
            matrix.Rho = fileData{3};
            matrix.Ultimate = fileData{4}*10^6;
            matrix.Reference=fileData{5}{1};
        end
    end
end

