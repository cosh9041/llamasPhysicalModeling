clear all;
close all;
clc;

L = [15, 20, 23.875, 30, 35];
r = 10.875;

theta = @(phi, L) asind(r.*sind(180-phi)./sqrt(r.^2 + L.^2 - 2.*r.*L.*cosd(180-phi)));
phi = 0:360;
figure
hold on
for i = 1:length(L)
    theta_vals = theta(phi, L(i));
    plot(phi, theta_vals)
    maxs(i) = max(theta_vals);
    mins(i) = min(theta_vals);
    idx_max(i) = find(theta_vals == max(theta_vals));
    idx_min(i) = find(theta_vals == min(theta_vals));
end
plot(phi(idx_max), maxs, 'p--', 'Linewidth', 1.5)
plot(phi(idx_min), mins, 'p--', 'Linewidth', 1.5)
xlabel('\phi (deg)')
ylabel('\theta (deg)')
title(sprintf('r = %.1f"', r)); 

legend(sprintf('L = %.3f:', L(1)), sprintf('L = %.3f:', L(2)), sprintf('L = %.3f"', L(3)),...
    sprintf('L = %.3f"', L(4)), sprintf('L = %.3f"', L(5)), 'Maximum theta locations')
