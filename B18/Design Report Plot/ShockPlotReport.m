function [  ] = ShockPlotReport( input_args )
%SHOCKPLOTREPORT Summary of this function goes here
%   Detailed explanation goes here


run = load('Round 2/2.mat');
begin = 1;
finish = numel(run.Engine_RPM.Time);
time = run.Engine_RPM.Time(begin:finish);
time = time - time(1);

Voltage = run.Aux_1_Volts_ECU.Value(begin:finish);

[a, b] = ShockCalibrationFunc();
Torque = Voltage*a + b;

plot(time,Torque)
xlabel('Time (s)');
ylabel('Torque (ft-lb)');
title('On-Car Shock Load Testing');


end

