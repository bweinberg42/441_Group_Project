function [ijk] = coordinate_change(ecef, theta)

R = [cosd(theta) -sind(theta) 0; 
     sind(theta) cosd(theta) 0; 
     0 0 1];
 
 ijk = R * ecef; 