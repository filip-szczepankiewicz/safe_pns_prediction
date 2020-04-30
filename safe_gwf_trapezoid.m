function gwf = safe_gwf_trapezoid(gamp, slew, dt, n_samp)
% function gwf = safe_gwf_trapezoid(gamp, slew, dt, n_samp)

wf = nan(1,n_samp);

t_ramp = gamp / slew;
n_ramp = ceil(t_ramp / dt)+1;

n_ramp_max = floor(n_samp/2);

wf_ramp = linspace(0,1,n_ramp);

n_ramp_use = min([n_ramp_max n_ramp]);

wf(1:n_ramp_use) = wf_ramp(1:n_ramp_use);

wf = flip(wf);

wf(1:n_ramp_use) = wf_ramp(1:n_ramp_use);

maxval = nanmax(wf);

wf(isnan(wf)) = maxval;

gwf = wf * gamp;