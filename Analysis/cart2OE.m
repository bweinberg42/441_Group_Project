function [oe] = cart2OE(states, mu)
% Converts from cartesian coordinates to Orbital Standard Orbital Elements
% Inputs: 
    % states: current state to be converted
        % [x y z xdot ydot zdot]
    % mu: constant set in 'set_parameters'
% Outputs:
    % oe: array of orbital elements
        %[a, e, i, omega, OMEGA, nu, M]

% Initialize x/y/z unit vector arrays for use with dot products

% Author: Blaire Weinberg

x = zeros(size(states, 1), 3);
x(:, 1) = 1;
y = zeros(size(states, 1), 3);
y(:, 2) = 1;
z = zeros(size(states, 1), 3);
z(:, 3) = 1;

% Find a, e
a = (-mu .* vecnorm(states(:, 1:3), 2, 2)) ./ ((vecnorm(states(:, 4:6), 2, 2).^2 .* vecnorm(states(:, 1:3), 2, 2)) - (2 .* mu));
ecc = (1 / mu) .* ((((vecnorm(states(:, 4:6), 2, 2).^2) - (mu ./ vecnorm(states(:, 1:3), 2, 2))) .* states(:, 1:3)) - (dot(states(:, 1:3), states(:, 4:6), 2) .* states(:, 4:6)));
e = vecnorm(ecc, 2, 2);

% find i
h = cross(states(:, 1:3), states(:, 4:6));
i = acosd(dot(h ./ vecnorm(h, 2, 2), z, 2));

% Determine 'big' Omega, including quadrant checks
n = cross(z, h);
if dot(n ./ vecnorm(n, 2, 2), y, 2) > 0
    OMEGA = acosd(dot(n ./ vecnorm(n, 2, 2), x, 2));
else
    OMEGA = 360 - acosd(dot(n ./ vecnorm(n, 2, 2), x, 2));
end

% Determine 'little' Omega, including quadrant checks
if dot(ecc ./ vecnorm(ecc, 2, 2), z, 2) > 0 
    omega = acosd(dot(n, ecc, 2) ./ (vecnorm(n, 2, 2) .* e));
else 
    omega = 360 - acosd(dot(n, ecc, 2) ./ (vecnorm(n, 2, 2) .* e));
end

% Determine nu, including quadrant checks
if dot(states(:, 1:3), states(:, 4:6), 2) > 0
    nu = acosd(dot(ecc, states(:, 1:3), 2) ./ (vecnorm(states(:, 1:3), 2, 2) .* e));
else
    nu = 360 - acosd(dot(ecc, states(:, 1:3), 2) ./ (vecnorm(states(:, 1:3), 2, 2) .* e));
end

% Determine M, including quadrant checks
E = acos((e + cosd(nu))/(1 + e * cosd(nu)));

if 180 < nu <= 360 && ~(pi < E <= 2*pi)
    disp('running')
    E = 2 * pi - E;
end

M = E - e * sin(E);

% Set output to a single array of all of the Orbital Elements
oe = [a, e, i, omega, OMEGA, nu, M];