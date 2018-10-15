% ======================================================================= %
% File: no2.m
% Cara menjalankan:
%  Jalankan no2 di command window dan hit enter
% Output:
%  Image asli dan image setelah enhancement
% 
% ======================================================================= %

% Membersihkan command history pada command window dan menghapus seluruh
% variable yang sudah disimpan pada aplikasi yang dijalankan sebelumnya.
clc 
clear

% Register path dimana custom function dibuat.
addpath('./functions/');

% Membaca image dan menyimpannya di variable INaskah.
INaskah = imread('./images/naskah.jpg');

% Adjust image.
J = imadjust(INaskah,[0.1048 0.2746],[]);

% Negative Image.
INegative = 255 - J;

% Gamma transformations.
IGamma = gamma_transformation(INegative, 1, 1);

% Tampilkan image
figure;
subplot(1, 2, 1), imshow(INaskah), title('Image asli');
subplot(1, 2, 2), imshow(IGamma), title('Enhance Image');






