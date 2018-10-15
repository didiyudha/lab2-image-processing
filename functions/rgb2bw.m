% ----------------------------
% Name       : rgb2bw
% Param      : path, level (luminance level)
% Return     : Black and white image
% Description: This function will takes 2 arguments,
% first, path where image stored, and second one is 
% level of intensity as a threshold of luminance. 
% The result is a black and white image.
% ----------------------------
function [IBW] = rgb2bw(I, level)
    IGray = rgb2gray(I);
    if isempty(level)
        level = 0.5;
    end
    IBW = im2bw(IGray, level);
end

