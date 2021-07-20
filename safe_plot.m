function h = safe_plot(pns, dt)
% function h = safe_plot(pns, dt)
% pns is relative PNS waveform (nx3)
% dt is time step size in seconds.

if nargin < 2
    ttot    = 1; % au
    xlabstr = 'Time [a.u.]';
else
    ttot = size(pns,1) * dt * 1000; % ms
    xlabstr = 'Time [ms]';
end

t  = linspace(0, ttot, size(pns,1));

pnsnorm = sqrt(sum(pns.^2, 2));

h = plot(...
    t, pns(:,1), 'r-',...
    t, pns(:,2), 'g-',...
    t, pns(:,3), 'b-',...
    t, pnsnorm , 'k--'...
    );

hold on; grid on;

ylim([0 120])
xlim([min(t) max(t)])

title(['Predicted PNS (' num2str(max(pnsnorm), '%0.0f') '%)']);

xlabel (xlabstr)
ylabel ('Relative stimulation [%]')

h(2) = plot([0 max(t)], [1 1] * max(pnsnorm(:)), 'k:');

h(3) = legend(...
    ['X (' num2str(max(pns(:,1)), '%0.0f') '%)'], ...
    ['Y (' num2str(max(pns(:,2)), '%0.0f') '%)'], ...
    ['Z (' num2str(max(pns(:,3)), '%0.0f') '%)'], ...
    ['nrm (' num2str(max(pnsnorm), '%0.0f') '%)'], ...
    'location', 'best');