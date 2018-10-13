function [IO] = gamma_transformation(I, c)
    a = double(I)/255;
    IO = c*(a.^2);
end

