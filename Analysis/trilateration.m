function [r] = trilateration(rho_obsv, ref, tolerance, r_guess)
r = r_guess;

rho_pred = sqrt((ref(:, 1) - r(1)).^2 + (ref(:, 2) - r(2)).^2 + (ref(:, 3) - r(3)).^2);

e = rho_obsv - rho_pred;

while norm(e) > tolerance
    A = [(r(1) - ref(1, 1)) / rho_obsv(1), (r(2) - ref(1, 2)) / rho_obsv(1), (r(3) - ref(1, 3)) / rho_obsv(1); 
         (r(1) - ref(2, 1)) / rho_obsv(2), (r(2) - ref(2, 2)) / rho_obsv(2), (r(3) - ref(2, 3)) / rho_obsv(2);
         (r(1) - ref(3, 1)) / rho_obsv(3), (r(2) - ref(3, 2)) / rho_obsv(3), (r(1) - ref(3, 3)) / rho_obsv(3)];

    r = r + inv(A) * e;
    
    rho_pred = sqrt((ref(:, 1) - r(1)).^2 + (ref(:, 2) - r(2)).^2 + (ref(:, 3) - r(3)).^2);
    
    e = rho_obsv - rho_pred;
end

