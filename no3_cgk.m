% ======================================================================= %
% NIM: 1806255336
% Nama: Didi Yudha Perwira
% File: no3_cgk.m
% Cara menjalankan:
%  Ketik no3_cgk di command window dan hit enter
% Output:
% Image asli dengan menandai area yang berbeda
% Luas area yang di print di command window
% ======================================================================= %

% Membersihkan command history pada command window dan menghapus seluruh
% variable yang sudah disimpan pada aplikasi yang dijalankan sebelumnya.
clc 
clear

% Import functions yang di buat sendiri pada direktori yang berbeda, di
% aplikasi ini semua utilities function disimpan di folder functions.
addpath('./functions/');

% Membaca data dari direktori images/
ICGK2016 = imread('./images/cgk2016.jpg');
ICGK2004 = imread('./images/cgk2004.jpg');

% Mengurangi image IDepok2016 dengan IDepok2005.
I = ICGK2016 - ICGK2004;

% Gamma transformation.
IGamma = gamma_transformation(I, 30, 2);

% Convert image RGB ke image grayscale.
IGray = rgb2gray(IGamma);

% Convert image dari grayscale ke binary dengan threshold luminance lebih
% besar dari 0.7
IBW = im2bw(IGray, 0.7);

% Menghilangkan area kecil dengan threshold pixel sebanyak 7000.
IBWOpen = bwareaopen(IBW,7000);

% Mendapatkan dimensi (rows dan cols) dari matrix image IBWOpen.
IBWOpenSize = size(IBWOpen);

% Mendapatkan jumlah row dari image IBWOpen.
row = IBWOpenSize(1);

% Mendapatkan jumlah cols dari image IBWOpen.
col = IBWOpenSize(2);

figure
imshow(I)
hold on;

% Mengisi "holes" dengan warna pixel putih
BW_filled = imfill(IBWOpen,'holes');

% Trace exterior boundary pada image BW_filled.
boundaries = bwboundaries(BW_filled);

% Plot line pada setiap image yang sudah di dapatkan boundaries nya.
for k=1:size(boundaries,1)
   b = boundaries{k};
   plot(b(:,2),b(:,1),'r','LineWidth',1);
end

% Menampilkan hasil dari perhitungan luas di command window.
fprintf('Luas Area: %d\n', sum(IBWOpen(:)));