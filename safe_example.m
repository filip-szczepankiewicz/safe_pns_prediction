clear
clf

% Load an exampe gradient waveform
[gwf, dt] = safe_example_gwf;

% Load reponse parameters for example hardware
hw = safe_example_hw();

% Predict PNS levels
pns = safe_gwf_to_pns(gwf, dt, hw);

% Plot some results
safe_plot(pns, dt);
