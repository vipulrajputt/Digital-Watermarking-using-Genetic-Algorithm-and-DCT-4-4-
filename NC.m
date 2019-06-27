function nc = NC(wm,exwm)
%This fuction is to find the NC
%   watermark and extracted watermark are the inputs

orgwm = double(wm);
extwm = double(exwm);

sum11 = sum(sum(orgwm.*extwm));
sum2 = sum(sum(orgwm.*orgwm));
sum3 = sum(sum(extwm.*extwm));

nc = sum11/(sqrt(sum2)* sqrt(sum3));
end

