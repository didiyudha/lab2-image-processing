function [IO] = gamma_transformation(I, c, p)
    a = double(I)/255;
    IO = c*(a.^p);
end

