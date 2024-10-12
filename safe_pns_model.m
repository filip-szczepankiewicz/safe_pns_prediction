function stim = safe_pns_model(dgdt, dt, hw)
% function stim = safe_pns_model(dgdt, dt, hw)
%
% dgdt (nx3) is in T/m/s
% dt   (1x1) is in s
% All time coefficients (a1 and tau1 etc.) are in ms.
%
% This PNS model is based on the SAFE-abstract;
% SAFE-Model - A New Method for Predicting Peripheral Nerve Stimulations in MRI
% by Franz X. Herbank and Matthias Gebhardt. Abstract No 2007. 
% Proc. Intl. Soc. Mag. Res. Med. 8, 2000, Denver, Colorado, USA
% https://cds.ismrm.org/ismrm-2000/PDF7/2007.PDF
% 
% The main SAFE-model was coded by Thomas Witzel @ Martinos Center,
% MGH, HMS, Boston, MA, USA.
% 
% The code was adapted/expanded/corrected by Filip Szczepankiewicz @ LMI
% BWH, HMS, Boston, MA, USA, and Lund University, Sweden.

% Calculate time constant alpha. NOTE the scaling; tau and dt need to be 
% in the same unit.
alpha1 = dt / (hw.tau1*1e-3 + dt);
alpha2 = dt / (hw.tau2*1e-3 + dt);
alpha3 = dt / (hw.tau3*1e-3 + dt);

stim1  = hw.a1 * abs( safe_tau_lowpass(    dgdt , alpha1 ) );
stim2  = hw.a2 *      safe_tau_lowpass(abs(dgdt), alpha2 )  ;
stim3  = hw.a3 * abs( safe_tau_lowpass(    dgdt , alpha3 ) );

stim   = (stim1 + stim2 + stim3) / hw.stim_limit * hw.g_scale * 100;

% Pre Git - Not sure where something goes awry, probably in the lowpass filter, 
% but compared to the Siemens simulator we are exactly a factor of pi off, so
% I'm dividing the final result by pi.
% Note also that the final result is essentially some kind of arbitrary
% unit. - TW - RESOLVED, see below. - FSz
% 
% UPDATE 210720 - The pi factor was not quite correct. Instead, the correct
% factor was determined by the gradient scale factor (hw.g_scale, defined 
% in the .asc file). Thanks to Maxim Zaitsev for supporting this buggfix and 
% validating that the updated code is accurate. - FSz

end


function fw = safe_tau_lowpass(dgdt, alpha)
% function fw = safe_tau_lowpass(dgdt, alpha)
%
% Apply a RC lowpass filter with time constant alpha derived from tau = RC to data 
% with sampling interval dt. 
% The SAFE model abstract by Hebrank et.al. just says "Lowpass with time-constant tau",
% so I decided to make the most simple filter possible here.
% The RC lowpass is also appealing because its something Siemens could have
% easily implemented on their hardware stimulation monitors, so I'm probably
% pretty close. - TW
%
% UPDATE 230206 - There was a factor alpha missing on the first sample; it
% has now been corrected. Thanks to Oliver Schad for finding this error.
% - FSz
%
% UPDATE 241012 - I tried to rewrite the model to only use one for loop per
% axis, however, after several attempts, this did not improve performance 
% in Matlab. Thus, a few things have changed, but it is still 3x3 for loops
% in total. - FSz

n     = length(dgdt);
fw    = zeros(n,1);
fw(1) = alpha * dgdt(1);

for i = 2:n
    fw(i) = alpha * dgdt(i) + (1-alpha) * fw(i-1);
end

end








