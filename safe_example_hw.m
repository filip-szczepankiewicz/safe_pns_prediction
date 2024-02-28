function hw = safe_example_hw()
% function hw = safe_example_hw()
%
% SAFE model parameters for EXAMPLE scanner hardware (not a real scanner).
% See comments for units.

hw.name          = 'MP_GPA_EXAMPLE';
hw.model         = 'Peripheral';
hw.checksum      = '1234567890';
hw.dependency    = '';

hw.x.tau1        =  0.20;  % ms
hw.x.tau2        =  0.03;  % ms
hw.x.tau3        =  3.00;  % ms
hw.x.a1          =  0.40;
hw.x.a2          =  0.10;
hw.x.a3          =  0.50;
hw.x.stim_limit  = 30.00;  % T/m/s
hw.x.stim_thresh = 24.00;  % T/m/s
hw.x.g_scale     =  0.35;  % 1

hw.y.tau1        =  1.50;  % ms
hw.y.tau2        =  2.50;  % ms
hw.y.tau3        =  0.15;  % ms
hw.y.a1          =  0.55;
hw.y.a2          =  0.15;
hw.y.a3          =  0.30;
hw.y.stim_limit  = 15.00;  % T/m/s
hw.y.stim_thresh = 12.00;  % T/m/s
hw.y.g_scale     =  0.31;  % 1

hw.z.tau1        =  2.00;  % ms
hw.z.tau2        =  0.12;  % ms
hw.z.tau3        =  1.00;  % ms
hw.z.a1          =  0.42;
hw.z.a2          =  0.40;
hw.z.a3          =  0.18;
hw.z.stim_limit  = 25.00;  % T/m/s
hw.z.stim_thresh = 20.00;  % T/m/s
hw.z.g_scale     =  0.25;  % 1