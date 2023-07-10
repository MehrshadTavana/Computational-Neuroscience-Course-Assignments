function SpikePlot(t,I_ext,max_I,v,name)

    figure('Name',name,'NumberTitle','off');
    subplot(2,1,1);
    plot(t,I_ext,'linewidth',2,'color','r');
    title([name,' : I(t)']);
    ylim([0,max_I*5/4]);
    xlabel('Time[ms]');
    ylabel('I_{ext} [uA]');
    grid on;
    grid minor; 

    subplot(2,1,2);
    plot(t,v,'linewidth',1,'color','b');
    title([name,' : V(t)']);
    ylim([-80,60]);
    xlabel('Time[ms]');
    ylabel('V(t) [mV]');
    grid on;
    grid minor; 
end