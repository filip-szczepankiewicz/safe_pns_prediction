function mode = safe_asc_fn_to_mode(fn)
% function mode = safe_asc_fn_to_mode(fn)
%
% This is a dirty way of seeing the difference between old and new hardware
% specification files. Obviously, it has to be improved but works for now.

[a, b, c] = fileparts(fn);

if strcmp('MP_GPA', b(1:6))
    % Old format before XA 61
    mode = 0;

elseif strcmp('MP_GradSys', b(1:10))
    % Newer format from approx 2023
    mode = [1 2];

else
    mode = nan;

end
