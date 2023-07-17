%% 1 Choising Image

%% 2 Load Image and Display
kerim = imread('kerim.jpg'); % Load image
% imshow(kerim);  %display on screen

% %% 3 Finding Image Resolution
% [row col chn] = size(kerim); % horizontal, vertical and channel
% info = imfinfo('kerim.jpg'); % alternative way
% pixel = row*col;
% mega_pixel = pixel*10^6;
% 
% %% 4 Saving the Image to Harddisk
% imwrite(kerim,'D:\Matlab\Image Processing\turak.jpg','jpg','quality',11); % 11
% 
% %% 5 Converting a Color Image into 8bit Grayscale
% imgray = rgb2gray(kerim);
% imshow(imgray);
% whos imgray
% 
% %% 6 Converting a Color Image into Double Grayscale
% im_double = im2double(kerim);
% img = im_double(:,:,1)/3+im_double(:,:,2)/3+im_double(:,:,3)/3;
% imshow(img);
% 
% %% 7 Image Transpose
% trans_img = img';
% imshow(trans_img);
% 
% %% 8 Adding/subtracting a constant to/from image
% subplot(121);
% sum_100 = imgray + 100;
% imshow(sum_100);
% title(+100);
% 
% subplot(122);
% sub_100 = imgray - 100;
% imshow(sub_100);
% title(-100);
% 
% %% 9 Multiplying/dividing image with a constant
% subplot(121);
% mul_2 = imgray*2;
% imshow(mul_2);
% title(+100);
% 
% subplot(122);
% div_2 = imgray/2;
% imshow(div_2);
% title(-100);
% 
% %% 10 Image difference
% diff = mul_2 - div_2;
% imshow(diff);
% 
% %% 11 Image negative
% negative_img = 255-kerim;
% imshow(negative_img);
% 
% %% 12 Converting grayscale into binary(black&white)
% treshold = [80 110 140];
% imgray = rgb2gray(kerim);
% for i = 1:3
%     subplot(1,3,i)
%     imbinary = imgray > treshold(i);
%     tit = int2str(treshold(i));
%     title(tit);
%     imshow(imbinary);
% end

% %% 13 Manipulating pixel groups
% [row col chn] = size(kerim); % horizontal, vertical and channel
% kerim(:,col/2,2:3) = 0;
% kerim(:,col/2,1) = 255;
% imshow(kerim);
% 
% kerim((row-100)/2:(row+100)/2,(col-100)/2:(col+100)/2,2) = 255; % middle 310 to 410
% kerim((row-100)/2:(row+100)/2,(col-100)/2:(col+100)/2, 1:2:3) = 0; % middle 310 to 410
% 
% imshow(kerim);

% %% 14 Cropping a rectangular patch from image
% % 111*211
% kerim((row-112)/2:(row+112)/2,(col-212)/2:(col+212)/2,2) = 255; % middle 310 to 410
% kerim((row-112)/2:(row+112)/2,(col-212)/2:(col+212)/2, 1:2:3) = 255; % middle 310 to 410
% imshow(kerim);

% %% 15 Flipping image horizontally
% [row col chn] = size(kerim); % horizontal, vertical and channel
% kerim = kerim(:,col:-1:1,:);
% imshow(kerim);
% 
% % %% 16 Finding average value of a channel in an image
% % average = 0;
% % for i = 1:row
% %     for j = 1:col
% %        average = average + kerim(i,j,2);
% %     end
% % end
% % average = average / (col*row)

% %% 17 Changing Color of an Object in the Image
% logo = imread('aybu.png');
% logo = im2double(logo);
% % foreground 1 = brown
% % background 8 = grey
% [row col chn] = size(logo); % horizontal, vertical and channel
% for i = 1:row
%    for j = 1:col
%     if logo(i,j,:) > [0.8 0.7 0.1] 
%         logo(i,j,:) = [0.5 0.1412 0.1569];
%     end
%    end
% end
% for i = 1:row
%    for j = 1:col
%     if logo(i,j,:) ~= [0.57 0.1412 0.1569] 
%         logo(i,j,:) = [0.4 0.4 0.4]; % dark gray
%     end
%    end
% end
% imshow(logo);

% %% 18 Generating a radial gradient image
% % radial = zeros(1550,1550);
% % 1550/2 = 775; think one xy coordinat that quarter of our shape
% clear all 
% clc
% 
% radial = zeros(350,350,3);
% for x=1:350
%     for y=1:350
%         radius = sqrt((x-175)^2+(y-175)^2);
%         if radius == 0;
%             radial(x, y, :) = 0;
%         elseif radius >= 246.06;
%             radial(x, y, :) = 255;
%         else
%             value = radius/255;
%             radial(x, y, :) = value ;
%         end
%     end
% end
% imtool(radial);