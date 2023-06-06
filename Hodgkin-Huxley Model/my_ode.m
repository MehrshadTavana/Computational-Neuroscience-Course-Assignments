function y = my_ode(odefun,t,y0,u)
    y = zeros(length(y0),length(t));
    y(:,1) = y0;
    for i = 1:length(t)-1
        y(:,i+1) = y(:,i) + (t(i+1)-t(i)).*(odefun(t(i),y(:,i),u(i)));
    end
end