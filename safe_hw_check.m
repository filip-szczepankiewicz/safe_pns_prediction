function safe_hw_check(hw)
% function safe_hw_check(hw)
%
% Make sure that all is well with the hardware configuration.

if (abs(hw.x.a1 + hw.x.a2 + hw.x.a3 - 1) > 0.001 || ...
    abs(hw.y.a1 + hw.y.a2 + hw.y.a3 - 1) > 0.001 || ...
    abs(hw.z.a1 + hw.z.a2 + hw.z.a3 - 1) > 0.001)

    error('a1+a2+a3 must be equal to 1!')
end