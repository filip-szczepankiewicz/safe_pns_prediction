function ltau = safe_longest_time_const(hw)
% function ltau = safe_longest_time_const(hw)
% Get the longest time constant. Can be used to estimate the size of zero
% padding.

ltau = max([...
    hw.x.tau1, hw.x.tau2, hw.x.tau3, ...
    hw.y.tau1, hw.y.tau2, hw.y.tau3, ...
    hw.z.tau1, hw.z.tau2, hw.z.tau3 ]);
    
    
