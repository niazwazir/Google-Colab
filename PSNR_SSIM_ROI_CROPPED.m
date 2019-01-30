%%FIRST ADD THE  matlab buitlin function compute_psnr.m by C.Dong SRCNN
%I = imread('WOMAN/woman_x4_GT.png');%First Create The Patch of GT Image%%%%
I = imread('WOMAN/woman_x4_MSLapSRN.png');%Second Create The Patch Model IMG%
%%
I2 = imcrop(I,[120 50 40 50]);
subplot(1,2,1)
imshow(I)
%axis on
title('Original Image')
subplot(1,2,2)
imshow(I2)
%axis on
title('Cropped Image')
%%
%imwrite(I2,'WOMAN/Patch_GT_x4.png');%SAVE THE GT PATCH IMAGE%%%%%%%%%%%%%%
imwrite(I2,'WOMAN/Patch_MSLapSRN_x4.png');%SAVE THE MODEL PATCH IMAGE%%%%%%%%%
%%
%CALCULATE THE PSNR AND SSIM
GT = imread('WOMAN/Patch_GT_x4.png'); %READ THE GT PATCH%%%%%%%%%%%%%%%%%%%
ModelImg = imread('WOMAN//Patch_MSLapSRN_x4.png');%READ THE MODEL PATCH%%%%%%%
psnr = compute_psnr(GT,ModelImg);
fprintf('PSNR for =   %f dB\n', psnr);
[ssimval, ssimmap] = ssim(GT,ModelImg);  
fprintf('The SSIM value is %0.4f.\n',ssimval);