clear
clf

% Load an exampe gradient waveform
[gwf, rf, dt] = safe_example_gwf;

% Load reponse parameters for example hardware
hw = safe_example_hw_peripheral();

% Check if hardware parameters are consistent
safe_hw_check(hw);

% Check if this hw is part of the library (validate hw)
safe_hw_verify(hw);

% Predict PNS levels
pns = safe_gwf_to_pns(gwf, rf, dt, hw, 1);

% Plot some results
safe_plot(pns, dt);
