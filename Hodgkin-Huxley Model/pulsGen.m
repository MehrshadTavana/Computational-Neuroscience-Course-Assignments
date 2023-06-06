function y = pulsGen(t,width,T,height)
    % width,T,height must be same size
    y = zeros(1,length(t));
    for i = 1:length(T)
        y = y + rectpuls(t-T(i),width(i)).*height(i);
    end
end