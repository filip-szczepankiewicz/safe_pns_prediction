function hw = safe_example_hw()
% function hw = safe_example_hw()
%
% SAFE model parameters for EXAMPLE scanner hardware (not a real scanner).
% See comments for units.

hw.name          = 'EXAMPLE_SYS';
hw.look_ahead    =  1.05;

hw.x.tau1        =  0.2;  % ms
hw.x.tau2        = 10.0;  % ms
hw.x.tau3        =  0.7;  % ms
hw.x.a1          =  0.2;
hw.x.a2          =  0.2;
hw.x.a3          =  0.6;
hw.x.stim_limit  = 20.0;  % T/m/s
hw.x.stim_thresh = 15.0;  % T/m/s

hw.y.tau1        =  0.5;  % ms
hw.y.tau2        = 10.0;  % ms
hw.y.tau3        =  0.5;  % ms
hw.y.a1          =  0.3;
hw.y.a2          =  0.2;
hw.y.a3          =  0.5;
hw.y.stim_limit  = 25.0;  % T/m/s
hw.y.stim_thresh = 20.0;  % T/m/s

hw.z.tau1        =  0.3;  % ms
hw.z.tau2        = 18.0;  % ms
hw.z.tau3        =  0.9;  % ms
hw.z.a1          =  0.2;
hw.z.a2          =  0.2;
hw.z.a3          =  0.6;
hw.z.stim_limit  = 20.0;  % T/m/s
hw.z.stim_thresh = 20.0;  % T/m/s