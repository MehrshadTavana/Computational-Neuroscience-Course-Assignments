function dydt = Hodgkin(y,I_ext,Cm,gNa,gKa,gl,ENa,EKa,El)
    % y = [v;n;m;h]
    dydt = zeros(4,1);
    dydt(1) = -1./Cm*(gl*(y(1)-El)+gNa*y(4)*(y(3)^3)*(y(1)-ENa)+gKa*(y(2)^4)*(y(1)-EKa)-I_ext);  % v'
    dydt(2) = (1/tav_n(y(1))) *(-y(2)+ final_n(y(1))); % n'
    dydt(3) = (1/tav_m(y(1))) *(-y(3)+ final_m(y(1)));  % m'
    dydt(4) = (1/tav_h(y(1))) *(-y(4)+ final_h(y(1)));  % h'
end