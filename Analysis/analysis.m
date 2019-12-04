%% Load data
% clear all
% clc
% close all
run set_data.m
run set_parameters.m

%% Trilateration 
rho_t1_sat1 = Trilateration(rho_obsv_t1_sat1, ref_matrix, 1e-4, rho_njtr_t1_sat1)
rho_t2_sat1 = Trilateration(rho_obsv_t2_sat1, ref_matrix, 1e-4, rho_njtr_t2_sat1)
rho_t1_sat2 = Trilateration(rho_obsv_t1_sat2, ref_matrix, 1e-4, rho_njtr_t1_sat2)
rho_t2_sat2 = Trilateration(rho_obsv_t2_sat2, ref_matrix, 1e-4, rho_njtr_t2_sat2)

%% Frame Conversion 
gst_t1 = GST(T1, t1); 
gst_t2_sat1 = GST(T2, t2_sat1); 
gst_t2_sat2 = GST(T2, t2_sat2); 

ijk_t1_sat1 = eceftoijk(rho_njtr_t1_sat1, gst_t1)
ijk_t2_sat1 = eceftoijk(rho_njtr_t2_sat1, gst_t1)
ijk_t1_sat2 = eceftoijk(rho_njtr_t1_sat2, gst_t1)
ijk_t2_sat2 = eceftoijk(rho_njtr_t2_sat2, gst_t1)

%% Lambert Solver
dt1 = seconds(t_sat1(2) - t_sat1(1));
dt2 = seconds(t_sat2(2) - t_sat2(1));

[v01, v1] = Lambert(ijk_t1_sat1, ijk_t2_sat1, dt1, 1, mu_earth, 1e-5)
[v02, v2] = Lambert(ijk_t1_sat2, ijk_t2_sat2, dt2, 1, mu_earth, 1e-5)