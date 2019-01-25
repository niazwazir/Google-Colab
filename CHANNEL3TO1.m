Img = imread('BSD100/img_003.png');
[H,W,Dim] = size(Img);
NewImg = zeros(H,W);
for i=1:H
    for j = 1:W
        NewImg(i,j) = Img(i,j,1)*0.333 + Img(i,j,2)*0.333 +Img(i,j,3)*0.333;
    end
end
G = mat2gray(NewImg);
imwrite(G,'wazirmodel.png')
Img1 = imread('wazirmodel.png');
imshow(Img1);
