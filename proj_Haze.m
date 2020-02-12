%Step0:
%reading image and storing the required values
 
im = imread('Hazy_Image.JPG');
%im = imread('canon.JPG');
%im = imread('london.JPG');
%im = imread('chicago.JPG');

im_GS=rgb2gray(im);
im_GS=double(im_GS);

%imshow(im_GS);
%size(im_GS)
im_in = double(im);
 
dimensions= size(im_in);
height = dimensions(1);
width = dimensions(2);

%creating a white sheet image
%im_white=[height,width];
%for i=1:width
%   for j=1:height
%       im_white(j,i,1)=255;
%       im_white(j,i,2)=255;
%       im_white(j,i,3)=255;
%   end
%   
%end

%imshow(im_white);
%size(im_white)

%step1:
%

% calculate the dark chanel
% this help for calculating the dark channel was taken from stackoverflow
%http://stackoverflow.com/questions/27008469/how-to-find-haze-of-an-image-on-matlab

%// Find minimum intensity for each location for each channel
se = strel('rectangle', [15 15]);
out_red = imerode(im_in(:,:,1), se);
out_green = imerode(im_in(:,:,2), se);
out_blue = imerode(im_in(:,:,3), se);

%// Create a new colour image that has these all stacked
out = cat(3, out_red, out_green, out_blue);

%// Find dark channel image
out_dark = min(out, [], 3);
test_m=out_dark;

imshow(out_dark);
%calculating the 10% of the lightest pixels in dark channel
vector_test_m=sort(reshape(test_m(:,:,1),1,width*height));

%size(vector_test_m,2)
top=size(vector_test_m,2)/10;
size(vector_test_m);

sum1=0;
for i=1:top
    sum1=sum1+vector_test_m(1,i);
end
   average=sum1/top; %average of the lightest 10%%ajeeb sa image with boundaries

newI=im_GS-out_dark;   


dark_px=min(vector_test_m);
brightest_px=max(vector_test_m);

low=dark_px+average;
range=brightest_px-dark_px;
dark_mag=range/4;


%range
count=0;

for i=1:height
    
    for j=1:width
        if ((out_dark(i,j,:)<brightest_px)&(out_dark(i,j,:)>dark_px))
            im_in(i,j,:)=im_in(i,j,:)-dark_mag;
        else
            im_in(i,j,:)=im_in(i,j,:)-dark_mag/2;%im_in(i,j,:)-dark_mag;
        end
    end
    
end

%imwrite(uint8(im_in),'attempted.jpg');
%imshow(uint8(im_in));
imwrite(uint8(out_dark),'dark_channel.jpg');
imshow(uint8(out_dark));
%subplot(1,3,1);
%imagesc(uint8(double(im)));
 
%imshow(out_dark);
%subplot(1,3,2);
%imagesc(uint8(double(out_dark)));
 
%subplot(1,3,3);
%imshow(uint8(double(im_in)));

%for i=1:height
%    for j=1:width
 %       if (im_in(i,j,:)>=average)%((im_in(i,j,:)<=low)&(im_in(i,j,:)>range))
  %          count=count+1;
   %         im_in(i,j,1)=im_in(i,j,1)-out_dark(i,j);%+average;%average;
    %        im_in(i,j:2)=im_in(i,j,2)-out_dark(i,j);%+average;%average;
     %       im_in(i,j:3)=im_in(i,j,3)-out_dark(i,j);%+average;%average;
      %  else%if ((im_in(i,j,:)>=low)&(im_in(i,j,:)<range))
   %         im_in(i,j:1)=im_in(i,j:1)-newI(i,j);%average;%out_dark(i,j);
    %        im_in(i,j:2)=im_in(i,j:2)-newI(i,j);%average;%out_dark(i,j);
     %       im_in(i,j:3)=im_in(i,j:3)-newI(i,j);%average;%out_dark(i,j);
     %   end
   % end
%end
%count
%imshow(uint8(im_in));

%newI=im_GS-out_dark;
%imshow(uint8(newI));

