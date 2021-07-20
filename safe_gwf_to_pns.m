function [pns, res] = safe_gwf_to_pns(gwf, rf, dt, hw, doPadding)
% function [pns, res] = safe_gwf_to_pns(gwf, rf, dt, hw, doPadding)
% 
% gwf (nx3) in T/m
% dt  (1x1) in s
% hw  (struct) is structure that describes the hardware configuration and PNS
% response. Example: hw = safe_example_hw().
% doPadding adds zeropadding based on the decay time.
%
% This PNS model is based on the SAFE-abstract;
% SAFE-Model - A New Method for Predicting Peripheral Nerve Stimulations in MRI
% by Franz X. Herbank and Matthias Gebhardt. Abstract No 2007. 
% Proc. Intl. Soc. Mag. Res. Med. 8, 2000, Denver, Colorado, USA
% https://cds.ismrm.org/ismrm-2000/PDF7/2007.PDF
% 
% The main SAFE-model was coded by Thomas Witzel @ Martinos Center,
% MGH, HMS, Boston, MA, USA.
% 
% The code was adapted/expanded by Filip Szczepankiewicz @ LMI
% BWH, HMS, Boston, MA, USA.

if nargin < 5
    doPadding = 1;
end

if doPadding
    zpt = safe_longest_time_const(hw) * 4 / 1000; % s;
    zp1 = zeros(round(zpt/4/dt),3);
    zp2 = zeros(round(zpt/1/dt),3);
    gwf = [zp1; gwf; zp2];
    rf  = [zp1(:,1); rf; zp2(:,1)];
end

safe_hw_check(hw);

dgdt = diff(gwf,1) / dt;

pns = zeros(size(dgdt));

for i = 1:size(dgdt,2)
    
    switch i
        case 1
            p = hw.x;
        case 2
            p = hw.y;
        case 3
            p = hw.z;
    end
    
    pns(:,i) = safe_pns_model(dgdt(:,i), dt, p);
    
end

% Export relevant paramters
res.pns  = pns;
res.gwf  = gwf;
res.rf   = rf;
res.dgdt = dgdt;
res.dt   = dt;
res.hw   = hw;





