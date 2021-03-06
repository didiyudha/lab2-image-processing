% ======================================================================= %
% NIM: 1806255336
% Nama: Didi Yudha Perwira
% File: no1.m
% Cara menjalankan:
%  Ketik no1 di command window dan hit enter
% Output:
%  image asli, image hitam putih, histogram untuk image hitam putih,
%  image crop, histogram image crop, grayscale image, histogram image
%  histogram equalization. Selain itu, image crop juga disimpan di
%  direktori result_images.
% ======================================================================= %


% Membersihkan command history pada command window dan menghapus seluruh
% variable yang sudah disimpan pada aplikasi yang dijalankan sebelumnya.
clc 
clear

% Import functions yang di buat sendiri pada direktori yang berbeda, di
% aplikasi ini semua utilities function disimpan di folder functions.
addpath('./functions/');

% 1.a
% Memanggil funsi rgb2bw yang di definisikan di dalam folder functions.
% Fungsi ini membutuhkan 2 parameter:
%   1. Image yang akan dirubah.
%   2. Level dari intensitas sebagai threshold dari luminance.
% Output dari function rgb2bw ini adalah image binary.
I = imread('images/coin_1000.jpg');
IBW = rgb2bw(I, 0.5);
% subplot(1,2,1), imshow(I), title('Image asli');
% subplot(1,2,2), imshow(IBW), title('Image hitam putih');

% Simpan citra hitam putih ke dalam folder result_images dengan 
% nama BW_1a.jpg
result_path = './result_images';
imwrite(IBW, strcat(result_path, '/BW_1a.jpg'));

% 1.b
% Plot nilai histogram dari image binary tersebut dengan range 
% intensitas 0-255. Karena disyaratkan untuk plot intensitas pada range 
% 0 - 255 sedangkan image yang kita punya adalah image binary, maka kita
% perlu mengubah image binary tersebut ke dalam bentuk uint8. Kembalian
% dari fungsi ini adalah counts, dan binLocation. Counts adalah jumlah
% pixel yang muncul, sedangkan binLocations adalah pixel-pixel yang
% terdapat pada image.
[counts,binLocations] = imhist(uint8(IBW));
fprintf('Pixels: %d, %d\n', binLocations(1), binLocations(2));
fprintf('Jumlah Pixel %d: %d\n', binLocations(1), counts(1));
fprintf('Jumlah Pixel %d: %d\n\n', binLocations(2), counts(2));
% imhist(uint8(IBW));

% 1.c
% crop citra hitam putih dengan mengambil ?range i?ndeks piksel horizontal 
% 200 sampai 400,dan vertikal 100 sampai 400. Disini kita akan menggunakan
% fungsi imcrop yang sudah tersedia pada Matlab. Disini kita bisa
% menggunakan 2 parameter yang ada di fungsi imcrop, yaitu Image dan rect. 
% Image adalah image yang akan di crop sedangkan rect terdiri dari xmin, 
% ymin, width, height. Untuk xmin, kita bisa set 200, karena titik minimum
% pada pixel horizontal. Untuk ymin kita bisa set 100, karena titik minimum
% pada pixel vertikal. Sedangkan width didapatkan dari mencari selisih
% pixel horizontal, 400 - 200 = 200, dan height didapatkan dari mencari
% selisih pixel vertikal 400 - 100 = 300. Sehingga kita bisa dapatkan nilai
% rect [200 100 200 300]. Parameter-parameter inilah yang akan kita masukan
% kedalam fungsi imcrop.
ICrop = imcrop(IBW, [200 100 200 300]);
[counts,binLocations] = imhist(uint8(ICrop));
fprintf('Pixels image crop: %d, %d\n', binLocations(1), binLocations(2));
fprintf('Jumlah Pixel %d image crop: %d\n', binLocations(1), counts(1));
fprintf('Jumlah Pixel %d image crop: %d\n\n', binLocations(2), counts(2));

% subplot(1,2,1), imshow(ICrop), title('Image binary');
% subplot(1,2,2), imhist(uint8(ICrop)), title('Histogram');

% 1.d
% Jadikan citra berwarna menjadi citra ?grayscale ?(memiliki intensitas 
% keabuan, tidak hanya hitam putih). Plot nilai histogram dari citra 
% tersebut.
% Untuk membuat citra menjadi gambar Grayscale, kita dapat menggunakan
% fungsi rgb2gray yang sudah pada pada matlab. Untuk plot nilai histogram
% citra grayscale kita dapat menggunakan fungsi imhist dengan parameter
% citra grayscale.
I = imread('./images/coin_1000.jpg');
IGray = rgb2gray(I);
% subplot(1,2,1), imshow(IGray), title('Grayscale image');
% subplot(1,2,2), imhist(IGray), title('Histogram');



% 1.e
% Lakukan? histogram equalization p?adagambar 1.d! Bandingkan citra sebelum 
% dan sesudah ?histogram equalization.
IHist = histeq(IGray);
% subplot(1,2,1), imshow(IGray), title('Sebelum histogram equalization');
% subplot(1,2,2), imshow(IHist), title('Sesudah histogram equalization');

figure;
subplot(3, 3, 1), imshow(I), title('Image asli');
subplot(3, 3, 2), imshow(IBW), title('Image hitam putih');
subplot(3, 3, 3), imhist(uint8(IBW)), title('Histogram Equalization');
subplot(3, 3, 4), imshow(ICrop), title('Image crop');
subplot(3, 3, 5), imhist(uint8(ICrop)), title('Histogram Equalization');
subplot(3, 3, 6), imshow(IGray), title('Grayscale image');
subplot(3, 3, 7), imhist(IHist), title('Histogram equalization');



