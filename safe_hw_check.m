function safe_hw_check(hw)
% function safe_hw_check(hw)
%
% Make sure that all is well with the hardware configuration.

if (abs(hw.x.a1 + hw.x.a2 + hw.x.a3 - 1) > 0.001 || ...
    abs(hw.y.a1 + hw.y.a2 + hw.y.a3 - 1) > 0.001 || ...
    abs(hw.z.a1 + hw.z.a2 + hw.z.a3 - 1) > 0.001)

    error('Hardware specification a1+a2+a3 must be equal to 1!')
end

axl = {'x', 'y', 'z'};

for i = 1:numel(axl)
    axn = axl{i};
    fnl = fieldnames(hw.(axn));

    for j = 1:numel(fnl)
        par = fnl{j};
        val = hw.(axn).(par);

        if isempty(val)
            error(['Hardware specification ' axn '.' par ' is empty!'])
        end
    end
end
