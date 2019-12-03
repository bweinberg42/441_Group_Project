function [OE] = TLE2OE(TLE, mu)

i = str2double(TLE(2, 9:16));
OMEGA = str2double(TLE(2,18:25));
e = str2double(strcat('0.', TLE(2,27:33)));
omega = str2double(TLE(2, 35:42));
M = str2double(TLE(2, 44:51));
n = str2double(TLE(2, 53:63)) * 2 * pi / (3600 * 24);

a = nthroot(mu / n^2, 3);

OE = [a; e; i; omega; OMEGA; M];