function rijk = eceftoijk(r,gst)
% This function takes in a column vector r containing the ECEF coordinates
% and converts it into an IJK vector.
    Rz = [cos(gst) sin(gst) 0;
         -sin(gst) cos(gst) 0;
         0 0 1];
    rijk = inv(Rz)*r;
end
