figure()
hold on;


subplot(3,2,[1,2]);
hold on;
load('CF3PlotData.mat')
plot(t, step(abs(coeffs(1)), abs(coeffs(2)), -abs(coeffs(3))), '-b');
load('SF3PlotData.mat')
plot(t, step(abs(coeffs(1)), abs(coeffs(2)), -abs(coeffs(3))), '-r');
title('Simulated Step Responses for Carbon and Steel, Based on Off-Car Test Data')
xlabel('Time (s)');
ylabel('Normalized Torque');
legend('Carbon', 'Steel');

subplot(3,2,[3,5]);
MinorPlotReport();

subplot(3,2,[4,6]);
ShockPlotReport();
