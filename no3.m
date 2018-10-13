% addpath('./functions/');
clc
clear

IDepok2016 = imread('./images/Depok2016.jpg');
IDepok2005 = imread('./images/Depok2005.jpg');

I = IDepok2016 - IDepok2005;
ILog =log_transformation(I, 5);
IGray = rgb2gray(ILog);

IBW = imbinarize(IGray);


rows = size(IBW, 1);
cols = size(IBW, 2);




