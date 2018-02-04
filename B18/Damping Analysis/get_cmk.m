function [c, m, k] = get_cmk(a, b, k1, u)
% returns c, m, k in terms of a, b, k1, mu
m = u / (k1 * (a^2 + b^2));
k = u / k1;
c = 2 * m * a;
end

