%% imshow
% A = [1 5 8
%     9 6 1
%     15 56 55];
% imshow(A) % imshow(I) displays the grayscale image I in a figure. imshow uses the default display range for the image data type and optimizes figure, axes, and image object properties for image display.
% imshow(A,[]) %displays the grayscale image I, scaling the display based on the range of pixel values in I. imshow uses [min(I(:)) max(I(:))] as the display range. imshow displays the minimum value in I as black and the maximum value as white. For more information, see the DisplayRange argument.
% % imshow(RGB) displays the truecolor image RGB in a figure.
% % imshow(BW) displays the binary image BW in a figure. For binary images, imshow displays pixels with the value 0 (zero) as black and 1 as white.
% % imshow(X,map) displays the indexed image X with the colormap map.
% %himage = imshow(___) returns the image object created by imshow.

%% imtool
% imtool('free.jpg')
% A = [1 5 8
%     9 6 1
%     15 56 55];
% imshow(A/9);
% black = zeros(100,100);
% imshow(black);
% white = ones(100,100);
% imshow(white);
% gray = white*0.7;
% imshow(gray);
% whos gray
% b = uint8(500)

% A = [1 2 3;
%     4 5 6;
%     7 8 9]
% A(5);
% result = A==5;
% [row col] = find(A==6)


% A = zeros(3);
% for row = 1:3
%     for col = 1:3
%         if row == col
%             A(row,col)=1
%         elseif row-col==1
%             A(row,col)=2
%         elseif row-col==2
%             A(row,col)=0
%         end
%     end
% end
% imshow(A,[]);

% a = 1;
% im = zeros(100);
% for i = 1:100
%     im(i,i) = 0.5,
% end
% imshow(im);

% green = zeros(300,300,3);
% green(:,:,2) = 1;
% imshow(green)

% im = imread('free.jpg');
% [row col chn] = size(im);
% imfinfo('free.jpg');

% subplot(121);
% im1 = imread('free.jpg');
% imshow(im1);
% 
% subplot(122);
% im2 = imread('free2.jpg');
% imshow(im2);

% im = imread('free.jpg');
% imshow(im/4);
% img =  (im*4);
% imwrite(img,'new.jpg','jpg');

% im = imread('free.jpg');
% im = rgb2gray(im);
% imshow(im);

%% anlamadım
% im = imread('free.jpg');
% imgray = rgb2gray(im);
% imbinary = imgray>100;
% imshow(imbinary);

%manual olarak gray scale elde etme
% im = im2double(im);
% img = im(:,:,1)/3+im(:,:,2)/3+im(:,:,3)/3;
% imshow(img);