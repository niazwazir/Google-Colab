close all
clear all
clc
img = imread('MANGA109/AkkeraKanjinchou resized.png'); %Read Image
imgray = rgb2gray(img); %Convert Color Image inot Gray Scale Image
imwrite(imgray,'wazirmodel.png');
ref = imread('wazirmodel.png');
A = imread('MANGA109SSIMSCALE4/AkkeraKanjinchouM.png');

[ssimval, ssimmap] = ssim(A,ref);
  
fprintf('The SSIM value is %0.4f.\n',ssimval);