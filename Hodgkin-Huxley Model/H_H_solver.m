function [v,n,m,h] = H_H_solver(t,I_ext)
    Cm = 1; % Membrane capacitance in micro Farads
    gNa = 120; % in Siemens, maximum conductivity of Na+ Channel
    gK = 36; % in Siemens, maximum conductivity of K+ Channel
    gl = 0.3; % in Siemens, conductivity of leak Channel
    ENa = 55; % in mv, Na+ nernst potential
    EK = -72; %      in mv, K+ nernst potential
    El = -49.4; % in mv, nernst potential for leak channel
    vRest = -60; % in mv, resting potential
    
    % y = [v,n,m,h]
    iniCon = [vRest;
        final_n(vRest);
        final_m(vRest);
        final_h(vRest)];

    y = my_ode(@(time,y,I) Hodgkin(y,I,Cm,gNa,gK,gl,ENa,EK,El),...
        t, iniCon,I_ext);
    v = y(1,:);
    n = y(2,:);
    m = y(3,:);
    h = y(4,:);
end