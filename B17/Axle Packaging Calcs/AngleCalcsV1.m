%% Basic (impossible) case where there's no eccentricity at all
Inboard = [61.98, 5.81, 8.69];
Outboard = [60.00, 18.33, 8.69];
Difference = Inboard - Outboard
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)

%% Inboard Min
InboardMin = [61.98, 5.81, 8.69] + [-0.25, 0, 0];
Outboard = [60.00, 18.33, 8.69];
Difference = InboardMin - Outboard
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)

%%
OutboardDroop = Outboard + [0, 0, -1];
Dif = OutboardDroop - Inboard;
UnitDif = Dif/norm(Dif);
UnitMax = (-UnitDif .* [1, 0, 1])/(norm(UnitDif .* [1, 0, 1]));
InboardMax = Inboard + 0.25*UnitMax;
Difference = OutboardDroop - InboardMax
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)

%%
OutboardDroop = Outboard + [0, 0, -1];
Dif = OutboardDroop - Inboard;
UnitDif = Dif/norm(Dif);
UnitMax = (-UnitDif .* [1, 0, 1])/(norm(UnitDif .* [1, 0, 1]));
InboardMax = Inboard + 0.25*UnitMax;
Difference = OutboardDroop - Inboard
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)


%% Test with short/med diff cups (0.612")
%% Basic (impossible) case where there's no eccentricity at all
Inboard = [61.98, 5.81, 8.69]+[0, -0.612, 0];
Outboard = [60.00, 18.33, 8.69]+[0, 0, 0];
Difference = Inboard - Outboard;
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)

%% Minimum Angle
InboardMin = [61.98, 5.81, 8.69]+[-.25, -0.612, 0];
Outboard = [60.00, 18.33, 8.69]+[0, 0, 0];
Difference = InboardMin - Outboard;
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)


%%
OutboardDroop = Outboard + [0, 0, -1];
Dif = OutboardDroop - Inboard;
UnitDif = Dif/norm(Dif);
UnitMax = (-UnitDif .* [1, 0, 1])/(norm(UnitDif .* [1, 0, 1]));
InboardMax = Inboard + 0.25*UnitMax;
Difference = OutboardDroop - InboardMax;
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)

%%
OutboardDroop = Outboard + [0, 0, -1];
Dif = OutboardDroop - Inboard;
UnitDif = Dif/norm(Dif);
UnitMax = (-UnitDif .* [1, 0, 1])/(norm(UnitDif .* [1, 0, 1]));
InboardMax = Inboard + 0.25*UnitMax;
Difference = OutboardDroop - Inboard;
Length = norm(Difference)
angle = acosd(dot(abs(Difference), [0, 1, 0])/Length)

