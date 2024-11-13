function [pns, Rworst] = safe_gwf_to_pns_random_rotation(gwf, rf, dt, hw, do_padding, n)
% function [pns, Rworst] = safe_gwf_to_pns_random_rotation(gwf, rf, dt, hw, do_padding, n)
%
% Rotate the waveform randomly, and return the worst encountered PNS and
% the rotation matrix that causes it. This brute force approach should/will
% be replaced by a optimization.

if nargin < 5
    do_padding = 1;
end

if nargin < 6
    n = 1000;
end

R = zeros(3, 3, n);
pns_max = zeros(n,1);

for i = 1:n
   
    R(:,:,i) = safe_rotmat_random();
    cpns = safe_gwf_to_pns(gwf * R(:,:,i), rf, dt, hw, do_padding);
    pns_max(i) = max(vecnorm(cpns,2,2));
    
end

[~, ind_max] = max(pns_max);

Rworst = R(:,:,ind_max);
pns    = safe_gwf_to_pns(gwf * Rworst, rf, dt, hw, do_padding);
