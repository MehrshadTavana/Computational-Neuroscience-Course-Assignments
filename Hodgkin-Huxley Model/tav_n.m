function y = tav_n(v)
    vRest = -60; % in mv, resting potential
    u = vRest - v;
    alpha_n = (.1 * u + 1)./(exp(1 + .1 * u) - 1) / 10;
    beta_n = .125 * exp(u/80);
    y = 1./(alpha_n + beta_n);
end