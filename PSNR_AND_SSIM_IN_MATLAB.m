%JUST ADD matlab buitlin function compute_psnr.m by C.Dong SRCNN
GT  = imread('baby_GT.bmp');
ModelImg  = imread('baby_M.bmp');
psnr = compute_psnr(GT,ModelImg);
fprintf('PSNR for =   %f dB\n', psnr);
[ssimval, ssimmap] = ssim(GT,ModelImg);  
fprintf('The SSIM value is %0.4f.\n',ssimval);