function [ber] = BER(orgimg,extimg)
%BER Summary of this function goes here
%   Detailed explanation goes here
orgimg1 = double(orgimg);
extimg1 = double(extimg);
[m n] = size(orgimg);
errate = 0;
for i=1:m
    for j=1:n
        if(orgimg1(i,j)==extimg1(i,j))
            errate=errate + 0;
        else
            errate=errate + 1;
        end
    end    
    ber = errate/(m*n);
end

