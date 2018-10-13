% ----------------------------
% Name       : rgb2bw
% Param      : path, level
% Return     : Black and white image
% Description: This function will takes 2 arguments,
% first, path where image stored, and second one is 
% level of intensity as a threshold of luminance. 
% The result is a black and white image.
% ----------------------------
function [IBW] = rgb2bw(path, level)
    I = imread(path);
    IGray = rgb2gray(I);
    IBW = im2bw(IGray, level);
end
