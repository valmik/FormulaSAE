%%%%%%%%%%%%%%%%%%%%%%%%%% Shock Factor of 1.7 %%%%%%%%%%%%%%%%%%%%

% Rockwest Axles
#2 Choice !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 2.5164
          FoS_TB: 4.7122
              OD: 2.2500
              ID: 2
       THICKNESS: 0.1250
          LENGTH: 17.5000
            MASS: 0.7689
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.6044

#1 CHOICE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
GoodAxle =   http://www.rockwestcomposites.com/products/35017

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 3.1596
          FoS_TB: 5.4151
              OD: 2.5000
              ID: 2.2500
       THICKNESS: 0.1250
          LENGTH: 17.5000
            MASS: 0.8594
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 'Yield'
    TWISTdegrees: 3.3003
.8594/16.326 = density = .0526 lbs/in^3

GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8857
          FoS_TB: 1.2518
              OD: 2.6250
              ID: 2.5000
       THICKNESS: 0.0625
          LENGTH: 17.5000
            MASS: 0.4636
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.2666


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 2.0763
          FoS_TB: 1.3286
              OD: 2.7500
              ID: 2.6250
       THICKNESS: 0.0625
          LENGTH: 17.5000
            MASS: 0.4862
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.5656


% ALUMINUM with shock load equivalent to yield stress
GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 2.5000
          FoS_TB: 14.9860
              OD: 2
              ID: 1.7187
          LENGTH: 17.5000
            MASS: 1.4378
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 50
    TWISTdegrees: 2.8517


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 2.5000
          FoS_TB: 8.9262
              OD: 2.2500
              ID: 2.0437
          LENGTH: 17.5000
            MASS: 1.2175
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 50
    TWISTdegrees: 2.5348


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 2.5000
          FoS_TB: 5.8729
              OD: 2.5000
              ID: 2.3397
          LENGTH: 17.5000
            MASS: 1.0660
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 50
    TWISTdegrees: 2.2814


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 2.5000
          FoS_TB: 4.1090
              OD: 2.7500
              ID: 2.6210
          LENGTH: 17.5000
            MASS: 0.9526
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 50
    TWISTdegrees: 2.0740


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 2.5000
          FoS_TB: 3.0010
              OD: 3
              ID: 2.8934
          LENGTH: 17.5000
            MASS: 0.8633
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 50
    TWISTdegrees: 1.9011

% RCV Off The Shelf Axles

GoodAxle = 

        MATERIAL: 'Steel 4130 RCV'
     FoS_Torsion: 1.5984
          FoS_TB: 13.0441
              OD: 0.8000
              ID: 0.5000
          LENGTH: 17.5000
            MASS: 1.5223
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 268
    TWISTdegrees: 16.8206

    
% Steel Regualar Tube Axles 

GoodAxle = 

        MATERIAL: 'Steel 4130 Normalized'
     FoS_Torsion: 2.3563
          FoS_TB: 5.6035
              OD: 2.5000
              ID: 2.4014
          LENGTH: 17.5000
            MASS: 1.8862
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 73.8000
    TWISTdegrees: 1.2504


GoodAxle = 

        MATERIAL: 'Steel 4130 Normalized'
     FoS_Torsion: 2.3563
          FoS_TB: 3.9962
              OD: 2.7500
              ID: 2.6698
          LENGTH: 17.5000
            MASS: 1.6972
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 73.8000
    TWISTdegrees: 1.1367


GoodAxle = 

        MATERIAL: 'Steel 4130 Normalized'
     FoS_Torsion: 2.3563
          FoS_TB: 2.9548
              OD: 3
              ID: 2.9333
          LENGTH: 17.5000
            MASS: 1.5450
     TORQUEinlbs: 8.2467e+03
     FAILUREMODE: 73.8000
    TWISTdegrees: 1.0420



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% HIGH SHOCK FACTOR OF 5.5 %%%%%%%%%%%%%%%%%%%
Carbon Fiber/AL/STEEL Calc History

11/30/2015 11:47pm
 
Inputs:

useIsotropic = 0; %Use isotropic material

if useIsotropic == 1;
    matNameString ={'Aluminum 2024-T3'}; %{'Aluminum 7075-T6','Aluminum 6061-T6','Aluminum 2024-T6', 'Steel 4130 Normalized','Steel 4340 Normalized'};
    materialSelection = length(matNameString);
else
    matrixName = {'Epoxy 3501'};
    fiberName =  {'DragonPlate'}; 
    layupName = {'Rockwest Filament Wound'}; 
    materialSelection = length(fiberName);
end

failureStress = 'Yield'; 
torque = 165*12*ZeroShockFactor1st*B16FinalDrive;  
ODRange = [2.25,2.5,1.25,2.375];        
IDRange = [2,2.25,1,2.25];              
axleLengthRange = linspace(15.5,17,length(ODRange)); 




GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.7260
          FoS_TB: 1.4445
              OD: 2.2500
              ID: 2
       THICKNESS: 0.1250
          LENGTH: 15.5000
            MASS: 0.6811
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 14.1358


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.9116
          FoS_TB: 1.6339
              OD: 2.5000
              ID: 2.2500
       THICKNESS: 0.1250
          LENGTH: 16
            MASS: 0.7857
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 10.4590


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.1956
          FoS_TB: 0.6323
              OD: 1.2500
              ID: 1
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.3838
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 100.5222


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.4420
          FoS_TB: 0.3223
              OD: 2.3750
              ID: 2.2500
       THICKNESS: 0.0625
          LENGTH: 17
            MASS: 0.4064
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 24.1258

%%  Carbon Fiber DragonPlate


ODRange = [3.25,3.05,3,2.75,2.625,2.5,2.375,2.25,1.25,]; 
IDRange = [2,1.75,1.875,1.5];

GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5955
          FoS_TB: 2.3393
              OD: 3.2500
              ID: 3
       THICKNESS: 0.1250
          LENGTH: 15.5000
            MASS: 1.0016
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.4530


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 3.9232
          FoS_TB: 44.9836
              OD: 3.0500
              ID: 2
       THICKNESS: 0.5250
          LENGTH: 15.6875
            MASS: 3.4400
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 1.9530


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.7170
          FoS_TB: 0.4498
              OD: 3
              ID: 2.8750
       THICKNESS: 0.0625
          LENGTH: 15.8750
            MASS: 0.4821
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 10.9946


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.5990
          FoS_TB: 0.4001
              OD: 2.7500
              ID: 2.6250
       THICKNESS: 0.0625
          LENGTH: 16.0625
            MASS: 0.4463
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 14.5254


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.5440
          FoS_TB: 0.3748
              OD: 2.6250
              ID: 2.5000
       THICKNESS: 0.0625
          LENGTH: 16.2500
            MASS: 0.4305
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 16.9511


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.9116
          FoS_TB: 1.6120
              OD: 2.5000
              ID: 2.2500
       THICKNESS: 0.1250
          LENGTH: 16.4375
            MASS: 0.8072
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 10.7450


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.4420
          FoS_TB: 0.3259
              OD: 2.3750
              ID: 2.2500
       THICKNESS: 0.0625
          LENGTH: 16.6250
            MASS: 0.3975
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 23.5936


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.7260
          FoS_TB: 1.3870
              OD: 2.2500
              ID: 2
       THICKNESS: 0.1250
          LENGTH: 16.8125
            MASS: 0.7387
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 15.3327


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 0.1956
          FoS_TB: 0.6229
              OD: 1.2500
              ID: 1
       THICKNESS: 0.1250
          LENGTH: 17
            MASS: 0.3955
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 103.5683

    
%% CUSTOM CARBON FIBER TUBING, SAME LEGNTH FOR WEIGHT COMPARISON

% T = 165*finaldrive*shock*12 unless otherwise specified
ODRange = 1.5:.125:3; 
IDRange = 1.5:.125:3;

%%%%%%%%%%%%%%%%%%%%%%%
%Best Option:
GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.2297
          FoS_TB: 1.9325
              OD: 2.8750
              ID: 2.6250
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9382
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.9527
    
    
    % 165+5 ftlbs affect on FoS => .0362 drop in FoS
    GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.1935
          FoS_TB: 1.8757
              OD: 2.8750
              ID: 2.6250
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9382
     TORQUEinlbs: 2.9451e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.1634
   
    % 165+10 ftlbs affect on FoS => .0706 drop in FoS
    GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.1594
          FoS_TB: 1.8221
              OD: 2.8750
              ID: 2.6250
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9382
     TORQUEinlbs: 3.0317e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.3741

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Email quotes to Rockwest for: 
1) GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.2297
          FoS_TB: 1.9325
              OD: 2.8750
              ID: 2.6250
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9382
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.9527
2)  DO NOT USE 3" OD   
% GoodAxle = 
% 
%            FIBER: 'DragonPlate'
%           MATRIX: 'Epoxy 3501'
%      FoS_Torsion: 1.3463
%           FoS_TB: 2.0429
%               OD: 3
%               ID: 2.7500
%        THICKNESS: 0.1250
%           LENGTH: 16.5000
%             MASS: 0.9809
%      TORQUEinlbs: 2.8584e+04
%      FAILUREMODE: 'Yield'
%     TWISTdegrees: 6.0858

3) GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307

 4) GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101

   

6)
GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523
    
    
%%%%%%%%%%%%%%%%%%%%%%%
%Alternative 3"OD Axle:
GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858

%Other OD/ID COMBOS
    GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3898
          FoS_TB: 6.6599
              OD: 2.3750
              ID: 1.8750
       THICKNESS: 0.2500
          LENGTH: 16.5000
            MASS: 1.4500
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 7.4468


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.4122
          FoS_TB: 4.1385
              OD: 2.6250
              ID: 2.2500
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.2474
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.6307


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.5653
          FoS_TB: 4.4054
              OD: 2.7500
              ID: 2.3750
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3114
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 5.7101


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.7264
          FoS_TB: 4.6757
              OD: 2.8750
              ID: 2.5000
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.3754
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.9523


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.8954
          FoS_TB: 4.9491
              OD: 3
              ID: 2.6250;
       THICKNESS: 0.1875
          LENGTH: 16.5000
            MASS: 1.4393
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 4.3227


GoodAxle = 

           FIBER: 'DragonPlate'
          MATRIX: 'Epoxy 3501'
     FoS_Torsion: 1.3463
          FoS_TB: 2.0429
              OD: 3
              ID: 2.7500
       THICKNESS: 0.1250
          LENGTH: 16.5000
            MASS: 0.9809
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 'Yield'
    TWISTdegrees: 6.0858

%% 2024 T3
 
% knockdown on shock torque shear stress amp = .7

GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 1.4286
          FoS_TB: 47.6790
              OD: 2
              ID: 1.1232
          LENGTH: 15.5000
            MASS: 3.3338
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 50
    TWISTdegrees: 4.4201


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 1.4286
          FoS_TB: 17.9954
              OD: 2.2500
              ID: 1.7519
          LENGTH: 15.8750
            MASS: 2.4854
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 50
    TWISTdegrees: 4.0241


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 1.4286
          FoS_TB: 10.1822
              OD: 2.5000
              ID: 2.1420
          LENGTH: 16.2500
            MASS: 2.1209
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 50
    TWISTdegrees: 3.7072


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 1.4286
          FoS_TB: 6.5699
              OD: 2.7500
              ID: 2.4726
          LENGTH: 16.6250
            MASS: 1.8915
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 50
    TWISTdegrees: 3.4480


GoodAxle = 

        MATERIAL: 'Aluminum 2024-T3'
     FoS_Torsion: 1.4286
          FoS_TB: 4.5546
              OD: 3
              ID: 2.7760
          LENGTH: 17
            MASS: 1.7273
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 50
    TWISTdegrees: 3.2319
 

%% 4130 Tubing
knockdown =.75;
GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 1.3333
          FoS_TB: 20.3588
              OD: 2
              ID: 1.6500
          LENGTH: 15.8000
            MASS: 4.5019
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 2.6460


GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 1.3333
          FoS_TB: 11.5439
              OD: 2.2500
              ID: 1.9990
          LENGTH: 16.1000
            MASS: 3.8300
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 2.3966


GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 1.3333
          FoS_TB: 7.3855
              OD: 2.5000
              ID: 2.3070
          LENGTH: 16.4000
            MASS: 3.3932
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 2.1972


GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 1.3333
          FoS_TB: 5.0666
              OD: 2.7500
              ID: 2.5955
          LENGTH: 16.7000
            MASS: 3.0760
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 2.0340


GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 1.3333
          FoS_TB: 3.6433
              OD: 3
              ID: 2.8729
          LENGTH: 17
            MASS: 2.8310
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 1.8979
%% 4130 Offtheshelf

knockfactor = .75

GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 0.1149
          FoS_TB: 2.4118
              OD: 0.7870
              ID: 0.5512
          LENGTH: 15.5000
            MASS: 1.0909
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 76.5193


GoodAxle = 

        MATERIAL: 'Steel 4130 SpecialMatWeb'
     FoS_Torsion: 0.1347
          FoS_TB: 3.8182
              OD: 0.8000
              ID: 0.5000
          LENGTH: 17
            MASS: 1.4788
     TORQUEinlbs: 2.8584e+04
     FAILUREMODE: 78.3000
    TWISTdegrees: 70.4352