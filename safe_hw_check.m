function is_ok = safe_hw_check(hw, verbose)
% function is_ok = safe_hw_check(hw, verbose)
%
% Make sure that all is well with the hardware configuration.

if nargin < 2
    verbose = 0;
end

is_ok = 0;

axl = {'x', 'y', 'z'};
fnl = {'stim_limit', 'stim_thresh', 'tau1', 'tau2', 'tau3', 'a1', 'a2', 'a3', 'g_scale'};

for i = 1:numel(axl)
    axn = axl{i};

    for j = 1:numel(fnl)
        par = fnl{j};
        val = hw.(axn).(par);

        if isempty(val)
            if verbose; warning(['Hardware specification ' axn '.' par ' (and potentially others) is empty!']); end
            return
        end
    end
end

if (abs(hw.x.a1 + hw.x.a2 + hw.x.a3 - 1) > 0.001 || ...
        abs(hw.y.a1 + hw.y.a2 + hw.y.a3 - 1) > 0.001 || ...
        abs(hw.z.a1 + hw.z.a2 + hw.z.a3 - 1) > 0.001)

    if verbose; warning('Hardware specification a1+a2+a3 must be equal to 1!'); end
    return
end

is_ok = 1;