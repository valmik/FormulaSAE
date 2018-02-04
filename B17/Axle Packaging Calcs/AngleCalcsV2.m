clear all
close all
disp('Start run')

%% Initial Variables
% This is the (mean) distance from the center of the tripod to the back
% during steady-state
PlungeGap = 0.75;

% This is the Y distance moved in during full droop
PlungeDroop = 0;

% This is the Y distance moved in during full bump
PlungeBump = 0;

% Here we define the backs of the cups without eccentricity (impossible)
InboardOriginal = [61.98, 4.93, 8.69];
OutboardOriginal = [60.00, 19.27, 8.69];

InboardDiffMove = [61.98, 4.32, 8.69];
OutboardDiffMove = [60.00, 19.27, 8.69];

Inboard = InboardDiffMove;
Outboard = OutboardDiffMove;

%% First Define minumum separation
% Figure out which eccentricity results in the smallest angle
Difference = (Outboard - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardMin = Inboard + 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMin = (Outboard-InboardMin).*[1, 0, 1];
if (norm(DifferenceMin) > norm(Difference))
    disp('ERROR, minumum is wrong')
end

%% Now use this to find the length of the axle
AxleLength = norm(Outboard - [0, PlungeGap, 0] - InboardMin - [0, PlungeGap, 0]);

disp(['The axle should be ', num2str(AxleLength), ' inches long, from tripod center to tripod center'])


%% Find the minumum angle
Difference = (Outboard-InboardMin).*[1, 0, 1];
Difference(2) = sqrt(AxleLength^2 - Difference(1)^2 - Difference(3)^2);
Angle = acosd(dot(abs(Difference), [0, 1, 0])/AxleLength);
DiffCup = (Outboard - InboardMin);
Plunge = DiffCup(2) - Difference(2) - PlungeGap*2;
if Plunge > .0001
    disp('Minimum plunge error')
end

disp(['The minimum angle is ', num2str(Angle), ' degrees'])

%% Now run on droop
OutboardDroop = Outboard - [0, 0, 1];

% Now find the worst eccentricity
Difference = (OutboardDroop - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardMax = Inboard - 0.25*UnitDif;

DifferenceMax = (OutboardDroop-InboardMax).*[1, 0, 1];
if (norm(DifferenceMax) < norm(Difference))
    disp('ERROR, maximum is wrong')
end

% Now find the angle
Difference = (OutboardDroop - InboardMax).*[1, 0, 1];
% This solves for the axle plunge as well
Difference(2) = sqrt(AxleLength^2 - Difference(1)^2 - Difference(3)^2);
Angle = acosd(dot(abs(Difference), [0, 1, 0])/AxleLength);
DiffCup = ((OutboardDroop - [0, PlungeDroop, 0] - InboardMax));
Plunge = DiffCup(2) - Difference(2) - PlungeGap*2;

disp(['The maximum angle during droop is ', num2str(Angle), ' degrees'])
disp(['The tripod moves ', num2str(Plunge), ' inches closer to the diff in droop'])

%% Now run on bump
OutboardBump = Outboard + [0, 0, 1];

% Now find the worst eccentricity
Difference = (OutboardBump - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardMax = Inboard - 0.25*UnitDif;

DifferenceMax = (OutboardBump-InboardMax).*[1, 0, 1];
if (norm(DifferenceMax) < norm(Difference))
    disp('ERROR, maximum is wrong')
end

% Now find the angle
Difference = (OutboardBump - InboardMax).*[1, 0, 1];
% This solves for the axle plunge as well
Difference(2) = sqrt(AxleLength^2 - Difference(1)^2 - Difference(3)^2);
Angle = acosd(dot(abs(Difference), [0, 1, 0])/AxleLength);
DiffCup = ((OutboardBump - [0, PlungeBump, 0] - InboardMax));
Plunge = DiffCup(2) - Difference(2) - PlungeGap*2;

disp(['The maximum angle during bump is ', num2str(Angle), ' degrees'])
disp(['The tripod moves ', num2str(Plunge), ' inches closer to the diff in bump'])
