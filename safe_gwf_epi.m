function [gwf, rf, dt, t] = safe_gwf_epi(g, s, ftt, etl, dt)
% function [gwf, rf, dt, t] = safe_gwf_epi(g, s, ftt, etl, dt)
% g   - max gradient amplitude
% s   - max slew rate
% ftt - flat top time
% etl - echo train length
% dt  - time step size


if nargin < 1
    g = 25e-3;
    s = 200;
    ftt = .5e-3;
    etl = round(128*0.5*0.75);
    n = 200;
    dt = (g/s * 2 + ftt) / n;

    [gwf, rf, dt, t] = safe_gwf_epi(g, s, ftt, etl, dt);

    plot(t, gwf)

    return
end


n = ceil(g/s/dt) + round(ftt/dt);
trp = safe_gwf_trapezoid(g, s, dt, n);


wf = [];
for i = 0:etl

    if i == 0
        wf = [wf; (-1)^(i)*trp'/2];
    else
        wf = [wf; (-1)^(i)*trp'];
    end
end

gwf = wf * [1 0 0];
rf  = ones(size(wf));
t   = linspace(0, numel(wf)*dt, numel(wf));
