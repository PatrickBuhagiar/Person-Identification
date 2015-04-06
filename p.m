function [y] = p(x)
    y = 1 / (1 + exp(-x));
    %y = tanh(x);
end