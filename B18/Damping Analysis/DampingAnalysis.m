trial = load('SF3');
time = trial.Aux_1_Volts_ECU.Time;

% find equilibrium voltage to measure amplitudes
equilibrium = mean(trial.Aux_1_Volts_ECU.Value((end-1000):end));
voltageOld = trial.Aux_1_Volts_ECU.Value;
voltage = trial.Aux_1_Volts_ECU.Value - equilibrium;

% find local maxima
[peaks, ploc] = findpeaks(voltage);

% filter out negative values
posPeakLoc = find(peaks>0);
peaks = peaks(posPeakLoc);
ploc = ploc(posPeakLoc);

% filter out values that don't follow descending peaks
newPLoc = find(diff(peaks) < 0);
peaks = peaks(newPLoc);
ploc = ploc(newPLoc);
ploc = ploc(1:10);

% % find local minima
% [valleys, vloc] = findpeaks(-1*voltage);
% 
% % filter out negative values
% posValLoc = find(valleys>0);
% valleys = valleys(posValLoc);
% vloc = vloc(posValLoc);
% 
% % filter out values that don't follow descending peaks
% newVLoc = find(diff(valleys) < 0);
% valleys = valleys(newVLoc);
% vloc = vloc(newVLoc);
% vloc = vloc(1:10);

% compile the ratios of all the points
ratios = zeros(1,9);
for i = 1:9
    ratios(i) = peaks(i+1)/peaks(i);
end

% plot results
plot(time,voltage)
hold on
plot(time(ploc), voltage(ploc), 'r*')
hold off
% plot(time(vloc), voltage(vloc), 'k*')

ratios = ratios(2:9);
dampingRatio = mean(ratios)


%% Also calculate using transient response equations:

close all

trial = load('SF3');
time = trial.Aux_1_Volts_ECU.Time;

initial = mean(trial.Aux_1_Volts_ECU.Value(1:1000));
equilibrium = mean(trial.Aux_1_Volts_ECU.Value((end-1000):end)) - initial;
voltage = trial.Aux_1_Volts_ECU.Value - initial;

[peaks, peakloc] = findpeaks(voltage);

[~, maxindex] = max(peaks);
% figure()
% plot(time(peakloc(maxindex-2):end), voltage(peakloc(maxindex-2):end))
time = time(peakloc(maxindex-2):end);
voltage = voltage(peakloc(maxindex-2):end);

[peaks, peakloc] = findpeaks(voltage);


%%% First, we look at percent overshoot.
% M_p = e^{-pi xi / sqrt(1-xi^2)}
% We've defined the initial point as -1, and the final as 0
% Therefore, M_p is just the first peak

M_p = (max(peaks) - equilibrium)/equilibrium;

% Now ln(M_p) = - pi xi / sqrt(1 - xi^2)
% ln(M_p) sqrt(1-xi^2) = - pi xi
% ln(M_p)^2 (1-xi^2) = pi^2 xi^2
% ln(M_p)^2 = (pi^2 + 1) xi^2
% xi = abs(sqrt(ln(M_p)^2 / (pi^2 + 1)))

xi = abs(sqrt(log(M_p)^2 / (pi^2 + 1)));


%%% Let's quickly get the DC gain k
k = equilibrium/1;

%%% Now we need the natural frequency, which we can get from settling time
% First we normalize the peaks
normpeaks = peaks/equilibrium;
[~, index] = max(normpeaks);
normpeaks = normpeaks(index:end);
normloc = peakloc(index:end);

% Now we find the first peak within 1% of the mean
setpeaks = (normpeaks > 0.99) & (normpeaks < 1.01);

% And use that to find the settling time
t_s = time(normloc(find(setpeaks, 1))) - time(1);

% We can relate the settling time to the poles
% t_s = 4.6/alpha = 4.6/xi omega_n
% omega_n = 4.6 / (xi t_s)
w_n = 4.6 / (xi * t_s);


%%% Let's also find the rise time for shiggles
maxv = max(peaks);
v90 = voltage > 0.9*maxv;
v10 = voltage > 0.1*maxv;
t90 = time(find(v90, 1));
t10 = time(find(v10, 1));
t_r = t90 - t10;

w_n = 1.8/t_r;


xi = 4.6 / (w_n * t_s);


%%% Now we model a 2nd order system with these qualities and see if it
%%% looks the same

num = k * w_n^2;
den = [1, 2*xi*w_n, w_n^2];

model = tf(num, den);

[Y, T] = step(model);

figure()
hold on
plot(T, Y, 'b')
plot((time-time(1)), voltage, 'k')
hold off

%%
k = 1.01;
xi = 0.01;
w_n = 3.3;

num = k * w_n^2;
den = [1, 2*xi*w_n, w_n^2];

model = tf(num, den);
stepinfo(model)



%% Least Squares

close all

trial = load('SF3');
time = trial.Aux_1_Volts_ECU.Time;

initial = mean(trial.Aux_1_Volts_ECU.Value(1:1000));
equilibrium = mean(trial.Aux_1_Volts_ECU.Value((end-1000):end)) - initial;
voltage = trial.Aux_1_Volts_ECU.Value - initial;

[peaks, peakloc] = findpeaks(voltage);

[~, maxindex] = max(peaks);

time = time(peakloc(maxindex-2):end);
time = time - time(1);
voltage = voltage(peakloc(maxindex-2):end);

z = 1:size(voltage, 2);
fit = @(A, xi, wn, phi) A * exp(-xi*wn*time(z)).*(sin(wn*sqrt(1-xi^2)*time(z)) + phi);
f_error = @(A, xi, wn, phi) sum(abs((fit(A, xi, wn, phi)-voltage(z)).^2));

coeffs = fminsearch(@(x) f_error(x(1), x(2), x(3), x(4)), [1, 0.5, 1, 0])


plot(time(z), fit(0.0195, 0.4408, 2.0445, 0.0136))



%% Initial Condition

close all

trial = load('SF3');
time = trial.Aux_1_Volts_ECU.Time;

% Idealize the data:

initial = mean(trial.Aux_1_Volts_ECU.Value(1:1000));
equilibrium = mean(trial.Aux_1_Volts_ECU.Value((end-1000):end)) - initial;
voltage = trial.Aux_1_Volts_ECU.Value - initial;

[peaks, peakloc] = findpeaks(voltage);

[~, maxindex] = max(peaks);

time = time(peakloc(maxindex-2):end);
time = time - time(1);
voltage = voltage(peakloc(maxindex-2):end);

dv = (voltage(2:end) - voltage(1:end-1))./(time(2:end) - time(1:end-1));

timemax = find(time>5, 1);
time = time(1:timemax);
voltage = voltage(1:timemax);

arbitrary = 200; % CHANGE BASED ON DATA
time = time(arbitrary:end);
time = time - time(1);
voltage = voltage(arbitrary:end);

% Do the regression

z = 1:size(voltage, 2);
fit = @(a, b, K1, K2, K3) -K1 + K1*exp(-a*time(z)).*(cos(b*time(z)) + (a/b)*sin(b*time(z))) - K2*exp(-a*time(z)).*sin(b*time(z)) - K3*exp(-a*time(z)).*sin(b*time(z));
f_error = @(a, b, K1, K2, K3) sum(abs((fit(a, b, K1, K2, K3)-voltage(z)).^2));

coeffs = fminsearch(@(x) f_error(x(1), x(2), x(3), x(4), x(5)), [1, 1, 1, 1, 1]);
RSS = f_error(coeffs(1), coeffs(2), coeffs(3), coeffs(4), coeffs(5));
TSS = sum((voltage - mean(voltage)).^2);
R2 = 1-(RSS/TSS)
% 
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
plot(time(z), voltage(z), 'k')
plot(time(z), fit(coeffs(1), coeffs(2), coeffs(3), coeffs(4), coeffs(5)), '-r')
hold off




