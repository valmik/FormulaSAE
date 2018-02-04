function [c, m, k, R2, M_p, plot1, plot2] = DampingAnalysis_func(arbitrary, offset, name)

trial = load(name);
time = trial.Aux_1_Volts_ECU.Time;

% Idealize the data:

initial = mean(trial.Aux_1_Volts_ECU.Value(1:1000));
equilibrium = mean(trial.Aux_1_Volts_ECU.Value((end-1000):end)) - initial;
voltage = (trial.Aux_1_Volts_ECU.Value - initial)/equilibrium;

[peaks, peakloc] = findpeaks(voltage);

[~, maxindex] = max(peaks);

time = time(peakloc(maxindex-offset):end);
time = time - time(1);
voltage = voltage(peakloc(maxindex-offset):end);

dv = (voltage(2:end) - voltage(1:end-1))./(time(2:end) - time(1:end-1));

timemax = find(time>5, 1);
time = time(1:timemax);
voltage = voltage(1:timemax);

%arbitrary = 200; % CHANGE BASED ON DATA
time = time(arbitrary:end);
time = time - time(1);
voltage = voltage(arbitrary:end);

% Do the regression

% Define an index
z = 1:size(voltage, 2);
fit = @(a, b, K1, K2, K3) -K1 + K1*exp(-a*time(z)).*(cos(b*time(z)) + (a/b)*sin(b*time(z))) - K2*exp(-a*time(z)).*sin(b*time(z)) - K3*exp(-a*time(z)).*sin(b*time(z));
f_error = @(a, b, K1, K2, K3) sum(abs((fit(a, b, K1, K2, K3)-voltage(z)).^2));

coeffs = fminsearch(@(x) f_error(x(1), x(2), x(3), x(4), x(5)), [1, 1, 1, 1, 1]);
RSS = f_error(coeffs(1), coeffs(2), coeffs(3), coeffs(4), coeffs(5));
TSS = sum((voltage - mean(voltage)).^2);
R2 = 1-(RSS/TSS);


% This repeats the minimization with different initial conditions, but it
% hasn't provided anything useful and takes way longer
% for i = [1:10]
%     zeros = 2*(rand(size(coeffs))-0.5);
%     coeffs2 = fminsearch(@(x) f_error(x(1), x(2), x(3), x(4), x(5)), zeros);
%     RSS2 = f_error(coeffs2(1), coeffs2(2), coeffs2(3), coeffs2(4), coeffs2(5));
%     R22 = 1-(RSS2/TSS)
%     if R22 < R2
%         R2 = R22;
%         coeffs = coeffs2;
%     end
% end

figure()
hold on
plot1 = plot(time(z), voltage(z), 'k');
plot2 = plot(time(z), fit(coeffs(1), coeffs(2), coeffs(3), coeffs(4), coeffs(5)), '-r');
% plot(time(z), voltage(z), 'k');
% plot(time(z), fit(coeffs(1), coeffs(2), coeffs(3), coeffs(4), coeffs(5)), '-r');
xlabel('time (s)')
ylabel('normalized voltage')
title(name)
hold off

[c, m, k] = get_cmk(coeffs(1), coeffs(2), coeffs(3), 1);



% Plot idealized step response
step = @(a, b, K1) -K1 + K1*exp(-a*time(z)).*(cos(b*time(z)) + (a/b)*sin(b*time(z)));
figure()
plot(time(z), step(abs(coeffs(1)), abs(coeffs(2)), -abs(coeffs(3))), '-r');
xlabel('time (s)')
ylabel('normalized voltage')
title([name ', idealized step response'])


% Calculate Percent overshoot
% M_p = e^{-pi xi / sqrt(1-xi^2)}
% xi = c / (2*sqrt(m*k))

xi = abs(c) / (2*sqrt(abs(m)*abs(k)));
M_p = exp(-pi * xi / sqrt(1 - xi^2));



end