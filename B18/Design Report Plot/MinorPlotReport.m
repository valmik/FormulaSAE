function [  ] = MinorPlotReport(  )
%MINORPLOTREPORT Summary of this function goes here
%   Detailed explanation goes here

AR1 = 191;
BR1 = -.099;
goalN = 1.67*10^6;

for shock_percentage = [.1, .05, .025, .01, .005, .0025, .001]
    shock_factor = linspace(1,2);
    sigma_allowable = AR1*(2*goalN*shock_percentage*shock_factor.^(-1/BR1) + 2*goalN*(1-shock_percentage)).^BR1;
%     sigma_allowable = sigma_allowable.*shock_factor;
    hold on
    plot(shock_factor, sigma_allowable)
end
title('Fatigue Sensitivity to Shock');
xlabel('Shock Factor');
ylabel('Max Allowable Stress (ksi)');
grid on
leg = legend('10%', '5%', '2.5%', '1%', '0.5%', '0.25%', '0.1%','Location','southwest');
pos = get(leg, 'Position');
pos(2) = pos(2)*0.9;
set(leg, 'Position', pos)
legaxis = axes('Parent', leg.Parent, 'Units', leg.Units, 'Position', leg.Position, ...
    'XTick', [], 'YTick', [], 'Color', 'none', 'YColor', 'none', 'XColor', 'none', ...
    'HandleVisibility', 'off', 'HitTest', 'off');
title(legaxis, {'Percent of Cycles' 'at Shock Load'}, 'FontWeight', 'bold', 'FontSize', 8);
hlink = linkprop([leg, legaxis], {'Units', 'Position', 'Visible'});
setappdata(legaxis, 'listeners', hlink);
addlistener(leg, 'ObjectBeingDestroyed', @(h,e) delete(legaxis));

legstr = get(leg, 'String');
legstr{8} = 'hi';
set(leg, 'String', legstr)
end

