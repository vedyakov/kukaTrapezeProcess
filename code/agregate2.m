clear all; close all;
load('workspace/fricTr.mat');
load('workspace/jointNum.mat');
[sn sm] = size(resWL);
reshWL = reshape(resWL,sn*sm,1);
reshTauL = reshape(resTauL,sn*sm,1);

reshWR = reshape(resWR,sn*sm,1);
reshTauR = reshape(resTauR,sn*sm,1);

reshW = [reshWL;reshWR];
reshTau = [reshTauL;reshTauR];

s = reshW~=0;
reshW = reshW(s);
reshTau = reshTau(s);

reshW = reshW(~isnan(reshW));
reshTau = reshTau(~isnan(reshW));

reshW = reshW(~isnan(reshTau));
reshTau = reshTau(~isnan(reshTau));

phi = [sign(reshW) reshW];
thetaLSE = inv(phi'*phi)*phi'*reshTau;

a = thetaLSE(1);
b = thetaLSE(2);

f = figure('pos',[30 60 1600 900]);  
hold on;
scatter(reshW,reshTau);
newW = min(reshW):0.01:max(reshW);
plot(newW,frictionApprox(newW,a,b),'LineWidth',2);
title(sprintf('¬€зкое трение звена є %d: \\tau = %.4f sign(\\omega) +  %.4f \\omega',jointNum,a,b));
xlabel(sprintf('\\omega_%d(рад.)',jointNum));
legend_handle = legend({'$\tau_m$','$\tau_a$'},'Interpreter','latex','Location','southeast');
legend_handle.FontSize = 16;
set(legend_handle);
grid on;
saveas(f,sprintf('imgs\\fricTr%d.png',jointNum));
hold off;

save('workspace/reshaped.mat','reshW','reshTau');
