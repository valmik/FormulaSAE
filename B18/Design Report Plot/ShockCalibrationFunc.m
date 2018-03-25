function [ a, b ] = ShockCalibrationFunc(  )
%SHOCKCALIBRATIONFUNC Summary of this function goes here
%   Detailed explanation goes here


torque1 = [56.7, 110.5, 166.8, 226.2, 287.9, 352.6, 480.1, 612.3, 482, 354.3, 288.7, 227.2, 167.5, 111, 56.8];
v1 = [3.45, 3.69, 3.94, 4.19, 4.45, 4.72, 5.27, 5.85, 5.29, 4.72, 4.44, 4.19, 3.93, 3.68, 3.45];
torque2 = [56.7, 110.5, 166.8, 226.7, 287.9, 353, 480.9, 613.1, 482.8, 354.9, 289.3, 227.6, 167.5, 111, 56.8];
v2 = [3.45, 3.68, 3.94, 4.19, 4.45, 4.72, 5.28, 5.85, 5.28, 4.71, 4.44, 4.19, 3.93, 3.68, 3.45];
torque3 = [56.7, 103.4, 159.8, 219.5, 280.8, 346.6, 473.9, 606.1, 475.8, 347.9, 282.2, 220.5, 160.3, 103.7, 49.4];
v3 = [3.45, 3.69, 3.94, 4.2, 4.46, 4.73, 5.28, 5.87, 5.3, 4.74, 4.46, 4.2, 3.94, 3.69, 3.45];

solutions = {0, 0, 0};
voltages = {v1, v2, v3};
torques = {torque1, torque2, torque3};
for index = 1:3
    voltage = voltages{index};
    torque = torques{index};
    z = 1:size(voltage, 2);
    fit = @(a, b) a*voltage(z) + b;
    f_error = @(a, b) sum(abs((fit(a, b)-torque(z)).^2));

    coeffs = fminsearch(@(x) f_error(x(1), x(2)), [1, 1]);
    RSS = f_error(coeffs(1), coeffs(2));
    TSS = sum((torque - mean(torque)).^2);
    R2 = 1-(RSS/TSS);
    solutions{index} = [coeffs(1), coeffs(2), R2];
end

a = mean([solutions{1}(1), solutions{2}(1), solutions{3}(1)]);
b = mean([solutions{1}(2), solutions{2}(2), solutions{3}(2)]);

end

