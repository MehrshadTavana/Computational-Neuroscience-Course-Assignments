function [v,u] = Izhikevich(t,a,b,c,d,I_ext,v0,u0)
    L = length(t);
    v = zeros(1,L);
    u = zeros(1,L);
    v(1) = v0;
    u(1) = u0;
    for i=1:L-1
        dt = t(i+1)-t(i);
        v(i+1) = v(i) + dt*(0.04*v(i)^2+5*v(i)+140-u(i)+I_ext(i));
        u(i+1) = u(i) + dt*(a*(b*v(i)-u(i)));
        if v(i+1)>30
            v(i+1)=c;
            u(i+1)=u(i)+d;
        end
    end
end