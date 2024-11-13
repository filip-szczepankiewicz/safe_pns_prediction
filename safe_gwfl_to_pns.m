function [pnsl, ind_max] = safe_gwfl_to_pns(gwfl, rfl, dtl, hw, do_padding)
% function [pnsl, ind_max] = safe_gwfl_to_pns(gwfl, rfl, dtl, hw, do_padding)

if nargin < 5
    do_padding = 1;
end

n = numel(gwfl);
pns_max = zeros(n,1);

for i = 1:n

    cgwf = gwfl{i};

    if iscell(rfl)
        crf = rfl{i};
    else
        crf = rfl;
    end
    
    if iscell(dtl)
        cdt = dtl{i};
    else
        cdt = dtl;
    end

    pnsl(:,:,i) = safe_gwf_to_pns(cgwf, crf, cdt, hw, do_padding);

    pns_max(i) = max(vecnorm(pnsl(:,:,i), 2, 2));

    if i == 1 && n>1
        pnsl(:,:,2:n) = 0;
    end
    
end

[~, ind_max] = max(pns_max);