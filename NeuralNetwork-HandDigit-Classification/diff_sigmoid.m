function y = diff_sigmoid(x)
    y = (exp(-x))./(1 + exp(-x)).^2;
end