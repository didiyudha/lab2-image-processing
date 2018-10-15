clc
clear

addpath('./functions');

ICGK2016 = imread('./images/cgk2016.jpg');
ICGK2004 = imread('./images/cgk2004.jpg');


I = ICGK2016 - ICGK2004;
IGamma = gamma_transformation(I, 30, 2);
IGray = rgb2gray(IGamma);
IBW = im2bw(IGray, 0.7);
IBWOpen = bwareaopen(IBW,7000);


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
   plot(b(:,2),b(:,1),'r','LineWidth',1);
end

fprintf('Luas Area: %d\n', sum(IBWOpen(:)));