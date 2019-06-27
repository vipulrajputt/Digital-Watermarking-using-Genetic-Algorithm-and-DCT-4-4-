function [wm]=exwmark(embimg)
% exwmark will extract the watermark which were
% embedded by the wtmark function

% embimg    = Embedded image
% wt        = Extracted Watermark


[row clm]=size(embimg);
m=embimg;

%%%%%%%%%%%%%%%%% To divide image in to 4096---8X8 blocks %%%%%%%%%%%%%%%%%%
k=1; dr=0; dc=0;
% dr is to address 1:8 row every time for new block in x
% dc is to address 1:8 column every time for new block in x
% k is to change the no. of cell
for ii=1:4:row % To address row -- 8X8 blocks of image
    for jj=1:4:clm % To address columns -- 8X8 blocks of image
        for i=ii:(ii+3) % To address rows of blocks
            dr=dr+1;
            for j=jj:(jj+3) % To address columns of block
                dc=dc+1;
                z(dr,dc)=m(i,j);
            end
            dc=0;
        end
        x{k}=z; k=k+1;
        z=[]; dr=0;
    end
end
nn=x;

%% Extract water mark %%
wm=[]; wm1=[]; k=1; wmwd=[]; wmwd1=[]
while(k<1025)
    for i=1:32
    kx=x{k}; % Extracting Blocks one by one
    dkx=blkproc(kx,[4 4],@dct2); % Applying Dct
    nn{k}=dkx; % Save DCT values in new block to cross check
    
    %% Change me for pixel location
    wm1=[wm1, dkx(4,4)]; % Forming a row of 32 by 8,8 element
   
    % Extracting water mark without dct
     wmwd1=[wmwd1 kx(4,4)];
      k=k+1;
    end
    wm=[wm;wm1]; wm1=[]; % Forming columns of 32x32
    wmwd=[wmwd;wmwd1]; wmwd1=[];
end

for i=1:32
    for j=1:32
        diff=wm(i,j); 
        if diff >=0
            wm(i,j)=0;
        elseif diff < 0
            wm(i,j)=1;
        end
    end
end

wm=wm';
imwrite(wm,'wex.jpg')
