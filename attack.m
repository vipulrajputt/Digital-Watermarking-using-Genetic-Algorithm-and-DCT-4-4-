function [nc, ber] = attack(embimg, wm )
%ATTACK Summary of this function goes here
%   Detailed explanation goes here
img1 = embimg;
wm = wm;


disp('Salt and pepper');
A1 = imnoise(embimg,'salt & pepper');
ewm1 = exwmark(A1);
nc1 = NC(wm,ewm1);
ber1 = BER(wm,ewm1);
ber = [ber1];
nc = [nc1];

disp('Gaussian');
A2 = imnoise(embimg,'gaussian');
ewm2 = exwmark(A2);
nc2 = NC(wm,ewm2);
ber2 = BER(wm,ewm2);
ber = [ber,ber2];
nc = [nc,nc2];

disp('Speckle');
A3 = imnoise(embimg,'speckle');
ewm3 = exwmark(A3);
nc3 = NC(wm,ewm3);
ber3 = BER(wm,ewm3);
ber = [ber,ber3];
nc = [nc,nc3];


disp('Poisson');
A4 = imnoise(embimg,'poisson');
ewm4 = exwmark(A4);
nc4 = NC(wm,ewm4);
ber4 = BER(wm,ewm4);
ber = [ber,ber4];
nc = [nc,nc4];


disp('Crop1');
A5 = imcrop(embimg,[1 1 255 255]);
ewm5 = exwmark(A5);
nc5 = NC(wm,ewm5);
ber5 = BER(wm,ewm5);
ber = [ber,ber5];
nc = [nc,nc5];

disp('Rotate1');
A6 = imrotate(embimg,-1,'crop');
ewm6 = exwmark(A6);
nc6 = NC(wm,ewm6);
ber6 = BER(wm,ewm6);
ber = [ber,ber6];
nc = [nc,nc6];

disp('Rotate10');
A7 = imrotate(embimg,-10,'crop');
ewm7= exwmark(A7);
nc7 = NC(wm,ewm7);
ber7 = BER(wm,ewm7);
ber = [ber,ber7];
nc = [nc,nc7];

disp('Translate');
A8 = imtranslate(embimg,[24.3, -10.1],'FillValues',255);
ewm8= exwmark(A8);
nc8 = NC(wm,ewm8);
ber8 = BER(wm,ewm8);
ber = [ber,ber8];
nc = [nc,nc8];

disp('Resize 256');
A9 = imresize(embimg,[256 256]);
ewm9= exwmark(A9);
nc9 = NC(wm,ewm9);
ber9 = BER(wm,ewm8);
ber = [ber,ber9];
nc = [nc,nc9];

disp('Resize 320');
A10 = imresize(embimg,[320 320]);
ewm10= exwmark(A10);
nc10 = NC(wm,ewm10);
ber10 = BER(wm,ewm10);
ber = [ber,ber10];
nc = [nc,nc10];



figure('Name','Attacks','units','normalized','outerposition',[0 0 1 1])
subplot(2,5,1);
imshow(A1);
title('Salt & Pepper');

subplot(2,5,6);
imshow(ewm1);
title('Salt & Pepper');

subplot(2,5,2);
imshow(A2);
title('Gaussian');

subplot(2,5,7);
imshow(ewm2);
title('Gaussian');

subplot(2,5,3);
imshow(A3);
title('Speckle');

subplot(2,5,8);
imshow(ewm3);
title('Speckle');

subplot(2,5,4);
imshow(A4);
title('Poisson');

subplot(2,5,9);
imshow(ewm4);
title('Poisson');

subplot(2,5,5);
imshow(A5);
title('Crop');

subplot(2,5,10);
imshow(ewm5);
title('Crop');


figure('Name','Attacks','units','normalized','outerposition',[0 0 1 1])
subplot(2,5,1);
imshow(A6);
title('Rotate -1');

subplot(2,5,6);
imshow(ewm6);
title('Rotate -1');

subplot(2,5,2);
imshow(A7);
title('Rotate -10');

subplot(2,5,7);
imshow(ewm7);
title('Rotate -10');

subplot(2,5,3);
imshow(A8);
title('Tanslate');

subplot(2,5,8);
imshow(ewm8);
title('Translate');

subplot(2,5,4);
imshow(A9);
title('Resize 256');

subplot(2,5,9);
imshow(ewm9);
title('Resize 256');

subplot(2,5,5);
imshow(A10);
title('Resize 320');

subplot(2,5,10);
imshow(ewm10);
title('resize 320');

end

