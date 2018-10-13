clc 
clear
% addpath('./functions/');
IBW = rgb2bw('images/coin_1000.jpg', 0.5);
imwrite(IBW, './result_images/1a.jpg');

IHist = histeq(uint8(IBW));
imhist(IHist);

ICrop = imcrop(IBW, [200, 100, 200, 300]);
imhist(ICrop);


IGray = rgb2gray(imread('images/coin_1000.jpg'));
imhist(IGray);

IHistGray = histeq(IGray);

subplot(2,2,1), imshow()



