addpath('./functions/');
clc
clear

IDepok2016 = imread('./images/Depok2016.jpg');
IDepok2005 = imread('./images/Depok2005.jpg');

I = IDepok2016 - IDepok2005;
ILog = gamma_transformation(I, 5);
IGray = rgb2gray(ILog);

IBW = imbinarize(IGray);
IBWOpen = bwareaopen(IBW, 1250);
imshow(IBWOpen)

IBWOpenSize = size(IBWOpen);

row = IBWOpenSize(1);
col = IBWOpenSize(2);

boundary = bwtraceboundary(IBWOpen,[row, col],'N');
figure
imshow(I)
hold on;

BW_filled = imfill(IBWOpen,'holes');
boundaries = bwboundaries(BW_filled);

for k=1:size(boundaries,1)
   b = boundaries{k};
   plot(b(:,2),b(:,1),'r','LineWidth',2);
end




