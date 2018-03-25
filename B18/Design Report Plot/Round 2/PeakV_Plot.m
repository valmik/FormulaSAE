peak_voltage = [5.18, 6.01, 5.8, 5.45, 5.85, 5.72, 5.57, 5.66, 5.72, 5.56, 5.78, 5.55];
peak_torque = peak_voltage*231.8 - 745.7;
plot(peak_torque, 'r.', 'MarkerSize',15);

xlabel('Launch Number');
ylabel('Torque');
title('Peak Torque Measurements');

saveas(gcf, 'PeakTorquePlot.png');