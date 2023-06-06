function y = final_h(v)
    vRest = -60; % in mv, resting potential
    u = vRest - v;
    alpha_h = 0.07 * exp(u/20);
    beta_h = 1 ./ (1+exp(3 + 0.1*u));    
    y = alpha_h./(alpha_h + beta_h);
end