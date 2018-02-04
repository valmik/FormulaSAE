clear all
close all
clc
fprintf('Start run')

%% Initial Variables
% This is the distance from the center of the tripod to the back of the cup
% when fully bottomed out
OffsetAtAngle = 0.803*sind(14);
OffsetAtAngle = 0.803*sind(10.9);
BottomOut = 0.5015 + OffsetAtAngle;
% This is our factor of safety (since values might be a bit different
PlungeFOS = 1.1;
% This is the min (mean) distance from the center of the tripod to the
% back of the housing
PlungeGap = (BottomOut) * PlungeFOS;

% This is the depth of each cup
CupDepth = 1.75; %1.75;
% This is the inner radius of each cup
CupRad = 0.7175;
% This is the axle radius
AxleRad = 0.435;

% Minumum clearance between axle and cup
MinClear = 1/16;

% This is the Y distance moved inwards during full droop
PlungeDroop = 0.081;
% This is the Y distance moved inwards during full bump
PlungeBump = -0.119;

% Here we define the backs of the cups without eccentricity (impossible)
% Inboard = [61.98, 4.32, 8.69-0.23];
Inboard = [61.814, 4.32, 8.458];
Outboard = [60.00, 19.27+.245-0.13, 8.69];

% Axle Length
% Find coordinates of max depth points in each of 6 cases

% The way we calculate is by taking the difference on the XZ plane, and
% finding the worst and best possible eccentricities

% Set the outboard coordinates for bump and droop
OutboardDroop = Outboard + [0, -PlungeDroop, -1];
OutboardBump = Outboard + [0, -PlungeBump, 1];

%% Min Ride:
Difference = (Outboard - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardRideMin = Inboard + 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMin = (Outboard-InboardRideMin).*[1, 0, 1];
if (norm(DifferenceMin) > norm(Difference))
    fprintf('ERROR, ride minumum is wrong \n')
end

%% Max Ride:
Difference = (Outboard - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardRideMax = Inboard - 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMax = (Outboard-InboardRideMax).*[1, 0, 1];
if (norm(DifferenceMax) < norm(Difference))
    fprintf('ERROR, ride maximum is wrong \n')
end

%% Min Bump:
Difference = (OutboardBump - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardBumpMin = Inboard + 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMin = (OutboardBump-InboardBumpMin).*[1, 0, 1];
if (norm(DifferenceMin) > norm(Difference))
    fprintf('ERROR, bump minimum is wrong \n')
end

%% Max Bump:
Difference = (OutboardBump - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardBumpMax = Inboard - 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMax = (OutboardBump-InboardBumpMax).*[1, 0, 1];
if (norm(DifferenceMax) < norm(Difference))
    fprintf('ERROR, bump maximum is wrong \n')
end

%% Min Droop:
Difference = (OutboardDroop - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardDroopMin = Inboard + 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMin = (OutboardDroop-InboardDroopMin).*[1, 0, 1];
if (norm(DifferenceMin) > norm(Difference))
    fprintf('ERROR, droop minimum is wrong \n')
end

%% Max Droop:
Difference = (OutboardDroop - Inboard).*[1, 0, 1];
UnitDif = Difference/norm(Difference);
InboardDroopMax = Inboard - 0.25*UnitDif;

% Check that you went in the right direction
DifferenceMax = (OutboardDroop-InboardDroopMax).*[1, 0, 1];
if (norm(DifferenceMax) < norm(Difference))
    fprintf('ERROR, ride maximum is wrong \n')
end

%% Now find the minumum distance / Axle Length
CupDifferences = {Outboard - InboardRideMin - [0, 2*PlungeGap, 0], ...
    Outboard - InboardRideMax - [0, 2*PlungeGap, 0] ...
    OutboardBump - InboardBumpMin - [0, 2*PlungeGap, 0] ...
    OutboardBump - InboardBumpMax - [0, 2*PlungeGap, 0] ...
    OutboardDroop - InboardDroopMin - [0, 2*PlungeGap, 0] ...
    OutboardDroop - InboardDroopMax - [0, 2*PlungeGap, 0]};

Names = {'Ride Min', 'Ride Max', 'Bump Min', 'Bump Max', 'Droop Min', 'Droop Max'};

[MinDist, Index] = min(cellfun(@norm, CupDifferences));
fprintf(['\nThe minimum distance (and thus the axle length) is ' ...
    , num2str(MinDist), ' inches, which is at ', Names{Index}, '\n'])

AxleLength = MinDist;


%% Now check Plunge at each case
ConstantAxleCalc = @(x) [x(1), sqrt(AxleLength^2 - x(1)^2 - x(3)^2), x(3)];
TripodDifferences = cellfun(ConstantAxleCalc, CupDifferences, ...
    'UniformOutput', false);

PlungeCalc = @(cup, tri) dot(cup - tri, [0, 1, 0]);
[MaxPlunge, Index] = max(cellfun(PlungeCalc, CupDifferences, TripodDifferences));

PlungeRange = CupDepth - PlungeGap*2;

if(MaxPlunge > PlungeRange)
    fprintf('Oh shit, the plunge is too high \n')
end

fprintf(['\nThe maximum axle plunge is ', num2str(MaxPlunge), ...
    ' inches which occurs at ', Names{Index}, ...
    '. \nThe plunge range allowed by the cups is ', num2str(PlungeRange), ...
    ' inches. \n'])

%% Now find the Euler angles
% We use Euler angles in ZYX format
% thetaZ = asin(TripodDifferences(1)/AxleLength)
% thetaY = 0
% thetaX = asin(TripodDifferences(3)/AxleLength)

EulerAngleCalc = @(x) [asin(x(1)/AxleLength), 0, asin(x(3)/AxleLength)];
EulerAngles = cellfun(EulerAngleCalc, TripodDifferences, ...
    'UniformOutput', false);

%% Now convert the Euler angles into actual angles

% to convert the Euler Angles to a single angle about an arbitrary axis, we
% convert to a rotation matrix, and then to axis-angle format
% AngleCalc = @(euler) vrrotmat2vec(eul2rotm(euler));
% Angles = cellfun(AngleCalc, EulerAngles, ...
%     'UniformOutput', false)
% Actually nvm I don't have the toolbox. But the angle is just
% angle = 2*acos(cos(z/2)cos(y/2)cos(x/2) - sin(z/2)sin(y/2)sin(x/2))
% and since I don't need the axis, it'll be fine

AngleCalc = @(euler) 2*acos(cos(euler(3)/2)*cos(euler(2)/2)*cos(euler(1)/2) - ...
    sin(euler(3)/2)*sin(euler(2)/2)*sin(euler(1)/2));
AngleZeroCamber = rad2deg(cellfun(AngleCalc, EulerAngles));
[MaxAngle, Index] = max(AngleZeroCamber);
if (mod(Index, 2) == 1)
    Index2 = Index+1;
else
    Index2 = Index-1;
end
fprintf(['\nThe max angle at zero camber is ', num2str(MaxAngle), ...
    ' degrees. \nThis happens at ' Names{Index}, ...
    '. \nThe angle at the same position, but with best case eccentricity is ' ...
    num2str(AngleZeroCamber(Index2)), ' degrees. \n'])

% remember that euler angles are ZYX camber. Camber is about the X axis,
% and positive camber is positive
AddCamber = @(euler, camber) [euler(1), euler(2), euler(3) + deg2rad(camber)];
AngleMaxCamber = rad2deg(cellfun(AngleCalc, ...
    cellfun(@(euler) AddCamber(euler, 1), EulerAngles, ...
    'UniformOutput', false)));
[MaxAngle, Index] = max(AngleMaxCamber);
if (mod(Index, 2) == 1)
    Index2 = Index+1;
else
    Index2 = Index-1;
end
fprintf(['\nThe max angle at positive one degree static camber is ', ...
    num2str(MaxAngle), ' degrees. \nThis happens at ' Names{Index}, ...
    '. \nThe angle at the same position, but with best case eccentricity is ' ...
    num2str(AngleMaxCamber(Index2)), ' degrees. \n'])

AngleMinCamber = rad2deg(cellfun(AngleCalc, ...
    cellfun(@(euler) AddCamber(euler, -3), EulerAngles, ...
    'UniformOutput', false)));
[MaxAngle, Index] = max(AngleMinCamber);
if (mod(Index, 2) == 1)
    Index2 = Index+1;
else
    Index2 = Index-1;
end
fprintf(['\nThe max angle at negative three degrees static camber is ', ...
    num2str(MaxAngle), ' degrees. \nThis happens at ' Names{Index}, ...
    '. \nThe angle at the same position, but with best-case eccentricity is ' ...
    num2str(AngleMinCamber(Index2)), ' degrees. \n'])


%% Now check for collision with the cups
% The axle is a line and the cup is a point (at least in one plane)
% The point is easy
CollisionPoint = [CupDepth-BottomOut, CupRad];
% The line is just y = xtan(theta)
% The distance from a point to a line is abs(Am + Bn +C)/sqrt(A^2 + B^2),
% where the line is Ax + By + C = 0 and the point is (m, n)
theta = max([AngleZeroCamber, AngleMaxCamber, AngleMinCamber]);
% Therefore, A = tan(theta), B = -1, and C = 0
CollisionDistance = abs(tand(theta)*CollisionPoint(1) - ...
    CollisionPoint(2))/sqrt(tand(theta)^2 + 1);

% Now perform a stupidity check that the angle isn't way higher than the
% max, and the distance is from the other side
if CollisionPoint(1)*tand(theta) > CollisionPoint(2)
   fprintf('Something be fucked. Your angle is way too high') 
end

% Check that it's greater than the clearance:
if CollisionDistance - AxleRad < MinClear
    fprintf('\nYour axle-to-cup clearance isn''t high enough')
end
    
fprintf(['\nThe distance between the axle and the cup at maximum angle is ', ...
    num2str(CollisionDistance - AxleRad), ' inches. \n'])

% Check the maximum possible angle
flag = false;
for phi = 0:0.01:30
    dist = abs(tand(phi)*CollisionPoint(1) - ...
    CollisionPoint(2))/sqrt(tand(phi)^2 + 1);
    if dist < AxleRad
        phi = phi - 0.01;
        flag = true;
        break
    end
end
if flag == false
   fprintf('Something be fucked if 30 degrees doesn''t cause a collision');
end

fprintf(['The maximum possible angle without collision is ', ...
    num2str(phi), ' degrees. \n'])



