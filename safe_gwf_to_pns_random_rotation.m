function [pns, Rworst] = safe_gwf_to_pns_random_rotation(gwf, rf, dt, hw, do_padding, n)
% function [pns, Rworst] = safe_gwf_to_pns_random_rotation(gwf, rf, dt, hw, do_padding, n)
%
% Rotate the waveform randomly, and return the worst encountered PNS and
% the rotation matrix that causes it. This brute force approach should/will
% be replaced by a minimization problem.

if nargin < 5
    do_padding = 1;
end

if nargin < 6
    n = 1000;
end

pns = 0;

for i = 1:n
   
    R = safe_rotmat_random();
    
    cgwf = gwf * R;
    
    cpns = safe_gwf_to_pns(cgwf, rf, dt, hw, do_padding);
    
    if max(cpns(:)) > max(pns(:))
        pns = cpns;
        Rworst = R;
    end
    
end

