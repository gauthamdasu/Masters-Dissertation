function [PeakSNR, Mean2err]=psnr(OriginalImage,WatermarkedImage)
%this function calculates the peak snr value
OriginalImage=double(OriginalImage);
WatermarkedImage=double(WatermarkedImage);
[N,M] = size(OriginalImage);
Imax = max(max(WatermarkedImage));
SumOfDiff2 = sum(sum((OriginalImage-WatermarkedImage).*(OriginalImage-WatermarkedImage)));
Mean2err=SumOfDiff2./(M*N);
sdf=Imax^2./(Mean2err);
if sdf ==0
    sdf=1;
end

PeakSNR = 10*log10(sdf);

