A = [1 2 3;
    4 5 6;
    7 8 9];
% imshow(A); % matrisi image olarak gösterir
% imshow(A,[]);
% imtool(A,[]);
% imshow(A/9);
% imtool(A/9)
% black = zeros(500,500);
% imshow(black);
% white = ones(500,500);
% imshow(white);
% gray = ones(500,500)*0.8
% imshow(gray);
% a = 5;
% whos a;
% b = uint8(5);
% whos b
% b = uint8(300); % matlab otomatik olarak 255'e çeker çünkü en fazla 8 bit gösteriliyor.


% matlabte 2 boyutlu arraylere  sütündan elemanın numarasını sayarakta
% ulaşabiliriz
% A = [1 2 3;
%     4 5 6;
%     7 8 9];
% A(2,3) ve A(8) aynı şeyler
% A(2:-1:1,:)



% A = [1 2 3;
%     4 5 6;
%     7 8 9];
% result= >> A==5 % A'nın içerisinde 5 ten büyük elemanlar 1 olur olmayanlar 0 olur



% [row col] = find(A==7)% anın içerisinde 7 Ye eşit olan elmanların satır ve sütünlarını verir


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
%     im(a,a) = 0.5,
% end
% imshow(im);

% green = zeros(500,500,3);
% green(:,:,1:2) = 1;
% imshow(green);


% im = imread('free.jpg');
% imshow(im);
% [row col ch] = size(im);
% 
% imfinfo('free.jpg');
% 
% imtool(im);





% subplot(1,2,1);
% im = imread('free.jpg');
% imshow(im);
% title('Bird');
% 
% subplot(1,2,2);
% im = imread('free2.jpg');
% imshow(im);
% title('Game');




% im = imread('free.jpg');
% % imshow(im/2); % parlaklığı azaltır
% imshow(im*2); % parlaklığı arttırır


% % resmi kaydetme
% im = imread('free.jpg');
% imbrigth = im*2;
% imwrite(imbrigth,'brigthimagea.jpg','jpg');

% % resmi gri yapma
% im = imread('free.jpg');
% imgray = rgb2gray(im);
% imshow(imgray);

% binary olarak gösterme
% im = imread('free.jpg');
% imgray = rgb2gray(im);
% imbinary = imgray>100;
% 
% imshow(imbinary);


%manual olarak gray scale elde etme
% im = im2double(im);
% img = im(:,:,1)/3+im(:,:,2)/3+im(:,:,3)/3;
% imshow(img);


%resmi yeniden boyutlandırma
% im = imread('free.jpg');
% imlowres = imresize(im,[50,50],'bilienar');
% imshow(imlowres);

%imrotate resim döndürme

%% lesson 2


















