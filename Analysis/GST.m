function [gst] = GST(T, t)
% Determines the Greenwich Sidereal Time
% Inputs: 
    % T: Vector containing centuries since J2000 (UTC)
    % t: Vector containing seconds from midnight to the observation
% Outputs:
    % gst: Greenwich Sidereal Time in degrees
    
w = 0.004178074; % deg/s

gst0 = 100.4606184 + (36000.77004 .* T) + (0.000387933 .* T.^2) - (2.583e-8 .* T.^3);
gst = gst0 + (w .* t); 