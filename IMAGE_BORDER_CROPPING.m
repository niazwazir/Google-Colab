im = imread('cameraman.tif');
I1 = padarray(im2double(im), [10 10]);
sizeI = size(I1);
zeros = floor((sizeI(2) -  min(sum(any(I1))))/2);
I2 = I1(:, zeros : sizeI(2)-zeros, :);
nonZero = sum(any(I1,2));


sizeI2 = size(I2);
zerosRows = floor((sizeI(1) -  min(sum(any(I2, 2))))/2);
I3 = I2(zerosRows : sizeI2(1)-zerosRows, :, :);
imwrite(I3,'Cropped Image.png');%SAVE THE MODEL PATCH IMAGE%%%%%%%%%

subplot(1,3,1), imshow(I1);title('Figure 1');
subplot(1,3,2), imshow(I2);title('Figure 2');
subplot(1,3,3), imshow(I3);title('Figure 3');