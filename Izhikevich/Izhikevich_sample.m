function Izhikevich_sample(name,a,b,c,d,h,v0,dt,T)
    t = 0:dt:T; 
    u0 = b*v0;
    I_ext = h.*heaviside(t-10);
    [v,~] = Izhikevich(t,a,b,c,d,I_ext,v0,u0);
    SpikePlot(t,I_ext,h,v,name);
end