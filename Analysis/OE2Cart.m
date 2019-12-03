function [states] = OE2Cart (oe, mu)
% Converts orbital elements to cartesian coordinates
% Inputs: 
    % oe: array of orbital elements
        %[a, e, i, OMEGA, omega, nu] 
    % mu: constant set in 'set_parameters'
% Outputs: 
    % states: current state 
        % [x y z xdot ydot zdot]

% Determine position vector
p = oe(1) * (1 - oe(2)^2);
r =  p / (1 + (oe(2) * cosd(oe(6))));
r = [r * cosd(oe(6)); r * sind(oe(6)); 0];

% Determine velocity vector
v =  sqrt(mu / p) .* [-sind(oe(6)); oe(2) + cosd(oe(6)); 0];

% Create rotation matrix
Rotate = [cosd(oe(5)) sind(oe(5)) 0; -sind(oe(5)) cosd(oe(5)) 0; 0 0 1] ...
        *[1 0 0; 0 cosd(oe(3)) sind(oe(3)); 0 -sind(oe(3)) cosd(oe(3))] ...
        *[cosd(oe(4)) sind(oe(4)) 0; -sind(oe(4)) cosd(oe(4)) 0; 0 0 1];
Rotate = Rotate';

% Rotate r, v vectors
r = Rotate * r;
v = Rotate * v;

% Set output to a standard state space vector
states = [r; v];