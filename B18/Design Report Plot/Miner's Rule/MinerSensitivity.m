shock_factor = 1.3;
shock_percentage = 0.1;

% 7075 SN UNNOTCHED, K = -1, AR1 = 148 BR1 = -.106
% 7075 SN UNNOTCHED, K = 0, AR1 = 191 BR1 = -.099
% 2024 T3 SN UNNOTCHED, AR1 = 211 BR1 = -.15
% 4340 SN kt = 1, K = -1, AR1 = 299 BR1 = -.088

AR1 = 191;
BR1 = -.099;

goalN = 1.67*10^6;

sigma_allowable = shock_factor*(AR1*(2*goalN*shock_percentage...
    *shock_factor^(-1/BR1) + 2*goalN*(1-shock_percentage))^BR1);