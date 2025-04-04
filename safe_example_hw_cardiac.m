function hw = safe_example_hw_cardiac()
% function hw = safe_example_hw_cardiac()
%
% SAFE model parameters for EXAMPLE scanner hardware (not a real scanner).
% See comments for units.

hw.name          = 'MP_GPA_EXAMPLE_CNS';
hw.model         = 'Cardiac';
hw.checksum      = '1234567891';
hw.dependency    = '';

hw.x.tau1        =  3.20;  % ms
hw.x.tau2        =  2.00;  % ms
hw.x.tau3        =  1.10;  % ms
hw.x.a1          =  0.70;
hw.x.a2          =  0.25;
hw.x.a3          =  0.05;
hw.x.stim_limit  = 20.00;  % T/m/s
hw.x.stim_thresh = 10.00;  % T/m/s
hw.x.g_scale     =  0.35;  % 1

hw.y.tau1        =  3.20;  % ms
hw.y.tau2        =  2.00;  % ms
hw.y.tau3        =  1.10;  % ms
hw.y.a1          =  0.70;
hw.y.a2          =  0.25;
hw.y.a3          =  0.05;
hw.y.stim_limit  = 20.00;  % T/m/s
hw.y.stim_thresh = 10.00;  % T/m/s
hw.y.g_scale     =  0.35;  % 1

hw.z.tau1        =  3.20;  % ms
hw.z.tau2        =  2.00;  % ms
hw.z.tau3        =  1.10;  % ms
hw.z.a1          =  0.70;
hw.z.a2          =  0.25;
hw.z.a3          =  0.05;
hw.z.stim_limit  = 13.00;  % T/m/s
hw.z.stim_thresh = 10.00;  % T/m/s
hw.z.g_scale     =  0.30;  % 1