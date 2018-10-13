clc
clear

addpath('./functions');

ICGK2016 = imread('./images/cgk2016.jpg');
ICGK2004 = imread('./images/cgk2004.jpg');

I = ICGK2016 - ICGK2004;

IGray = rgb2gray(I);

ILog = log_transformation(IGray, 5);
imshow(ILog);

IBW = im2bw(ILog, 0.9);
imshow(bwareaopen(IBW, 10000));