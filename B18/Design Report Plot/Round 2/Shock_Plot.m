run = load('2.mat');
begin = 1;
finish = numel(run.Engine_RPM.Time);
%finish = 1223; 
time = run.Engine_RPM.Time(begin:finish);

Voltage = run.Aux_1_Volts_ECU.Value(begin:finish);
RPM = run.Engine_RPM.Value(begin:finish);
Vmax = max(Voltage);
Tmax = time(find(Voltage == Vmax));

plot(time,Voltage,Tmax,Vmax,'.','MarkerSize',20)
xlabel('Time (s)');
ylabel('Strain Gauge Voltage');
title(['Run 2 - Peak Voltage: ' num2str(Vmax,4) ' V']);
%saveas(gcf,'2.png');