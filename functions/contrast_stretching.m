function [I_out] = contrast_stretching(I_in)
    a = min(I_in(:));
    b = 255 / (max(I_in(:)) - min(I_in(:)));
    I_out = (I_in - a) .* b;
end

