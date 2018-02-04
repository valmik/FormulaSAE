%{
11/30/2015 9:35pm - Matrix and Fiber Properties Eric Orig Had
The FoS for torsion is slightly off when compared to Joe's FoS, very close
however off by to the 1st decimal

GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5960
          FoS_TB: 0.5290
              OD: 1.5000
              ID: 1.4200
       THICKNESS: 0.0400
          LENGTH: 18
            MASS: 0.1739
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 11.2004


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 3.2325
          FoS_TB: 0.9932
              OD: 2
              ID: 1.9100
       THICKNESS: 0.0450
          LENGTH: 18
            MASS: 0.2619
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.1476


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 13.4981
          FoS_TB: 6.8450
              OD: 3
              ID: 2.8300
       THICKNESS: 0.0850
          LENGTH: 18
            MASS: 0.7378
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 0.6622



Paramters:

DragonPlate:
All units in MPA,kg,m. Except FAW, which is in g/m^2 This is fiber is based off of a T650 fiber and Dragonplate's data.
E1=234420
E2=14480
Poisson12=0.27
Poisson23=0.74
Density=1770
Ultimate=4137
FAW=0.150
Reference: None

Epoxy:
All units in MPa,kg/m^3.
E=4400
Poisson=0.36
Density=1260
Ultimate=69
Reference: KollarReference: Kol

%%%%%%%%%%%%%%%%%%%%%%%%%
11/30/2015 9:30pm - Matrix and Fiber Properties Johnathan Changed to Match Joe's Spreadsheets
Made it so DragonPlate and Epoxy 3501 match values with joes

Masses are roughly half as heavy than joes masses

GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5973
          FoS_TB: 0.5303
              OD: 1.5000
              ID: 1.4200
       THICKNESS: 0.0400
          LENGTH: 18
            MASS: 0.1739
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 11.1915


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 3.2351
          FoS_TB: 0.9957
              OD: 2
              ID: 1.9100
       THICKNESS: 0.0450
          LENGTH: 18
            MASS: 0.2619
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.1443


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 13.5089
          FoS_TB: 6.8618
              OD: 3
              ID: 2.8300
       THICKNESS: 0.0850
          LENGTH: 18
            MASS: 0.7378
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 0.6616

Parameters:

DragonPlate:
All units in MPA,kg,m. Except FAW, which is in g/m^2 This is fiber is based off of a T650 fiber and Dragonplate's data.
E1=234421.74796
E2=14478.99032
Poisson12=0.27
Poisson23=0.74
Density=1770
Ultimate=4137
FAW=0.150
Reference: None

Epoxy 3501:
All units in MPa,kg/m^3.
E=4400
Poisson=0.35
Density=1260
Ultimate=69
Reference: Kollar

%%%%%%%%%%%%%%%%%%%%%%%%%
11/30/2015 10pm - Matrix and Fiber Properties Johnathan Changed to Match Joe's Spreadsheets
Made it so DragonPlate and Epoxy 3501 match values with joes
Fixed the v23===v12 equation

GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.6204
          FoS_TB: 0.5295
              OD: 1.5000
              ID: 1.4200
       THICKNESS: 0.0400
          LENGTH: 18
            MASS: 0.1739
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 11.0317


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 3.2820
          FoS_TB: 0.9942
              OD: 2
              ID: 1.9100
       THICKNESS: 0.0450
          LENGTH: 18
            MASS: 0.2619
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.0851


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 13.7045
          FoS_TB: 6.8519
              OD: 3
              ID: 2.8300
       THICKNESS: 0.0850
          LENGTH: 18
            MASS: 0.7378
     TORQUEinlbs: 3100
     FAILUREMODE: 'Yield'
    TWISTdegrees: 0.6522



Parameters:

DragonPlate:
All units in MPA,kg,m. Except FAW, which is in g/m^2 This is fiber is based off of a T650 fiber and Dragonplate's data.
E1=234421.74796
E2=14478.99032
Poisson12=0.27
Poisson23=0.74
Density=1770
Ultimate=4137
FAW=0.150
Reference: None

Epoxy 3501:
All units in MPa,kg/m^3.
E=4400
Poisson=0.35
Density=1260
Ultimate=69
Reference: Kollar

