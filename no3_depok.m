% ======================================================================= %
% NIM: 1806255336
% Nama: Didi Yudha Perwira
% File: no3_depok.m
% Cara menjalankan:
%  Ketik no3_depok di command window dan hit enter
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
IDepok2016 = imread('./images/Depok2016.jpg');
IDepok2005 = imread('./images/Depok2005.jpg');

% Mengurangi image IDepok2016 dengan IDepok2005.
I = subtract(IDepok2016, IDepok2005);

% Gamma transformation.
ILog = gamma_transformation(I, 5, 2);

% Convert image RGB ke image grayscale.
IGray = rgb2gray(ILog);

% Convert image dari grayscale ke binary.
IBW = imbinarize(IGray);

% Menghilangkan area kecil dengan threshold pixel sebanyak 1250.
IBWOpen = bwareaopen(IBW, 1250);

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
   plot(b(:,2),b(:,1),'r','LineWidth',2);
end

% Menampilkan hasil dari perhitungan luas di command window.
fprintf('Luas Area: %d\n', sum(IBWOpen(:)));



