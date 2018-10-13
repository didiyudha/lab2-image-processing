clc 
clear

INaskah = imread('./images/naskah.jpg');
Igray = rgb2gray(INaskah);
J = imadjust(Igray,[0.1048 0.2746],[]);

INegative = 255 - J;

a = double(INegative)/255; 
c = 1;
p2 = 1;
f2 = c*(a.^p2);

imread()






