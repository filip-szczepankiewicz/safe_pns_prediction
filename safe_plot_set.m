function h = safe_plot_set(gwf, rf, dt, hw, doPadding)
% function h = safe_plot_set(gwf, rf, dt, hw, doPadding)

n = numel(gwf);

h = ceil(sqrt(n));
w = floor(sqrt(n));

for i = 1:n

    pns = safe_gwf_to_pns(gwf{i}, rf{i}, dt{i}, hw, doPadding);

    subplot(h, w, i)
    safe_plot(pns, dt{i})

end