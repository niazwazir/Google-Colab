Img1 = imread('Hamlet_x8_bicubic.png');
 Img1=imresize(Img1,[256 256]);

 f=figure;
 imshow(Img1);
 rect = getrect(f); %//select roi with mouse
 Img1_roi = Img1( rect(2) : (rect(2)+rect(4)) , rect(1) : (rect(1)+rect(3)) , : ); %//store roi in matrix

 %//Plot
 imshow(Img1)
 imshow(Img1_roi)
