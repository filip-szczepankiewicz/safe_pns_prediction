function [gwf, n_ramp_use] = safe_gwf_trapezoid(gamp, slew, dt, n_samp)
% function [gwf, n_ramp_use] = safe_gwf_trapezoid(gamp, slew, dt, n_samp)
%
% gamp is the maximal gradient amplitude in T/m
% slew is the maximal slew rate in T/m/s
% dt is the sample dwell time in s
% n_samp is the number of samples in the waveform

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