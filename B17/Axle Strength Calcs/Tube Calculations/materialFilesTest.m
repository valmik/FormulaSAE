% Concatenate fileName
str='Aluminum 7075-T6';
fileName=['./Materials/',str,'.txt'];
% Open file
fileID = fopen(fileName);
% This is how the data is organized in the txt file
formatSpec = '%*s Density=%f Ultimate=%f Yield=%f E=%f Poisson=%f';
% Take the data and ouput it as a string
fileData = textscan(fileID,formatSpec,...
    'Delimiter', '\n');
% Close the file to unlock it and remove the file from memory
fclose(fileID);

% Add the data into our properties
Rho=fileData{1}
Ultimate=fileData{2}
Yield=fileData{3}
E1=fileData{4}
E2=fileData{4}
Nu=fileData{5}

