% ======================================================================= %
% File: no2.m
% Cara menjalankan:
%  Jalankan no2 di command window
% 
% ======================================================================= %

% Membersihkan command history pada command window dan menghapus seluruh
% variable yang sudah disimpan pada aplikasi yang dijalankan sebelumnya.
clc 
clear

% Membaca image dan menyimpannya di variable INaskah.
INaskah = imread('./images/naskah.jpg');

% Adjust image.
J = imadjust(INaskah,[0.1048 0.2746],[]);

% Negative Image.
INegative = 255 - J;

% Gamma transformations.
a = double(INegative)/255; 
c = 1;
p2 = 1;
f2 = c*(a.^p2);
imshow(INegative);






