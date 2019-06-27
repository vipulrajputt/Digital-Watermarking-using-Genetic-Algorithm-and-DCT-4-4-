clc
clear

img = rgb2gray(imread('lenna.jpg'));
wm = imbinarize(imread('w.jpg'));
[ embimg , p ] = wtmark(img,wm);
exwm = exwmark(embimg);
nc = NC(wm,exwm);
ber = BER(wm,exwm);




figure;
subplot(2,2,1);
imshow(img);
title('Original image');
subplot(2,2,2);
imshow(wm);
title('Watermark');
subplot(2,2,3);
imshow(embimg);
title('Watermarked image');
subplot(2,2,4);
imshow(exwm);
title('Extracted Watermark');


%NC and BER for different attacks

[nc1,ber1] = attack(embimg,wm);
cmpr = [nc,nc1;ber,ber1];

rowNames = {'NC','BER'};
colNames = {'Original','Salt_Pepper','Gaussian',...
    'Speckle','poisson','crop','Rotate_1','Rotate_10'...
    ,'Translate','Resize_256','Resize_320'};
sTable = array2table(cmpr,'RowNames',rowNames,'VariableNames',colNames)

