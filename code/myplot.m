function myplot( mx,my,legendY,pathname,position,tit )
f = figure('pos',[30 60 1600 900]);  
plot(mx,my,'LineWidth',2);
title(tit);
xlabel('q_4(рад.)');
legend_handle = legend(legendY,'Interpreter','latex','Location',position);
legend_handle.FontSize = 16;

set(legend_handle);
grid on;
saveas(f,pathname);

end

