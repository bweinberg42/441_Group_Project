function [v0, v] = Lambert(r0, r, dt, direction, mu, tol_t)
% This function is a lambert solver for elliptical solutions only
% Inputs: 
    % r0: initial position vector 
    % r : final position vector
    % dt: time of flight
    % direction: +1 for short way, -1 for long way about the orbit
    % mu: orbital parameter for whichever body is being orbited
    % tol_t: tolerance for which to break the loop
% Outputs:
    % v0: Initial velocity vector
    % v : final velocity vector
    
cosdnu = dot(r0, r) / (norm(r0) * norm(r));
A = direction * sqrt(norm(r) * norm(r0) * (1 + cosdnu));

if A == 0
    error('Cannot Calculate Orbit, A = 0');
end

% Initial States
psi_n = 0;
c2 = 1/2;
c3 = 1/6;

psi_up = 4 * pi^2;
psi_down = -4 * pi;

dt_n = 0;
loop = 0;
loop_max = 100;

while ((abs(dt - dt_n) > tol_t)&&(loop < loop_max))
    loop = loop + 1; 
    yn = norm(r0) + norm(r) + (A * (psi_n * c3 - 1) / sqrt(c2));
    chi_n = sqrt(yn / c2);
    dt_n = (chi_n^3 * c3 + A * sqrt(yn)) / sqrt(mu);

    if dt_n <= dt
        psi_down = psi_n;
    else
        psi_up = psi_n;
    end

    psi_n = (psi_up + psi_down) / 2;

    if psi_n > 1e-6
     c2 = (1 - cos(sqrt(psi_n))) / psi_n;
     c3 = (sqrt(psi_n) - sin(sqrt(psi_n))) / sqrt(psi_n^3);
    elseif psi_n < -1e-6
        c2 = (1 - cosh(sqrt(-psi_n))) / psi_n;
        c3 = (-sqrt(-psi_n) + sinh(sqrt(-psi_n))) / sqrt((-psi_n)^3);
    else 
        c2 = 1/2;
        c3 = 1/6;
    end
end

f = 1 - (yn / norm(r0));
g = A * sqrt(yn / mu);
gdot = 1 - (yn / norm(r));

v0 = (r - f .* r0) ./ g;
v = (gdot .* r - r0) ./ g;