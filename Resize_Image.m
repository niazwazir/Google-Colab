I1=imread('Our_Patch.png'); % READ ORIGINAL IMAGE
I2 = imresize(I1,[24 24]);  % RESIZE ORIGINAL IMAGE 24 x 24
%In=rgb2gray(I2); % use if the image containing RGB value 3
figure;imshow(I2);
imwrite(I2,'Our.png') ;