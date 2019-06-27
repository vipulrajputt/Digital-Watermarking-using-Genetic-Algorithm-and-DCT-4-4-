function y=psnr(processed,original)
processed=im2double(processed);
original=im2double(original);
[m n]=size(original);

error=processed - original;
se=error.*error;
sumse=sum(sum(se));
mse=sumse/(m*n);

ma=max(max(processed));
y=10*log10(ma*ma/mse);
