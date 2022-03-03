function hwo = safe_hw_mergeIfNotEmpty(hw, hwdep)
% function hwo = safe_hw_mergeIfNotEmpty(hw, hwdep)
% Merge two hardware setups such that all non empty parameters form the
% dependency are used.

hwo = hw;

axl = {'x', 'y', 'z'};

for i = 1:numel(axl)
    axn = axl{i};
    fnl = fieldnames(hwdep.(axn));

    for j = 1:numel(fnl)
        par = fnl{j};
        val = hwdep.(axn).(par);

        if ~isempty(val)
            hwo.(axn).(par) = val;
        end
    end
end

