%% Load data
% clear all
% clc
% close all
run set_data.m
% run set_parameters.m

%% Trilateration 
rho_t1_sat1 = Trilateration(rho_obsv_t1_sat1, ref_matrix, 1e-4, rho_njtr_t1_sat1)
rho_t2_sat1 = Trilateration(rho_obsv_t2_sat1, ref_matrix, 1e-4, rho_njtr_t2_sat1)
rho_t1_sat2 = Trilateration(rho_obsv_t1_sat2, ref_matrix, 1e-4, rho_njtr_t1_sat2)
rho_t2_sat2 = Trilateration(rho_obsv_t2_sat2, ref_matrix, 1e-4, rho_njtr_t2_sat2)

%% Frame Conversion 
gst_t1_sat1 = GST(T1, t1); 
gst_t2_sat1 = GST(T2, t2_sat1); 
gst_t2_sat2 = GST(T2, t2_sat2); 
