
image = imread('checker_board.png'); 

%converting the image to grayscale if it is RGB
image = rgb2gray(image);

%%applying sobel filter in the horizontal direction
fx = [-1 0 1;-1 0 1;-1 0 1];
Ix = filter2(fx,image);
% applying sobel filter in the vertical direction
fy = [1 1 1;0 0 0;-1 -1 -1];
Iy = filter2(fy,image); 

%squaring each element
Ix2 = Ix.^2;
Iy2 = Iy.^2;

%member-wise product of Ix and Iy
Ixy = Ix.*Iy;


%making a gaussian kernel
sigma=2;
h= fspecial('gaussian',[9 9],sigma); 
%applying gaussian filter on the computed value

Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
y = size(image,1);
x = size(image,2);
result = zeros(y,x); 
R = zeros(y,x);

Rmax = 0; 

%this part is taken off from youtube (https://www.youtube.com/watch?v=hjc0t31VF5I)
for i = 1:y
        for j = 1:x
                M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)]; 
                R(i,j) = det(M)-0.01*(trace(M))^2;
                if R(i,j) > Rmax
                    Rmax = R(i,j);
                end;
        end;
end;
counter = 0;

%this part too has been taken from youtube (tutorial on harris detector https://www.youtube.com/watch?v=hjc0t31VF5I)
for i = 2:y-1
        for j = 2:x-1
            if R(i,j) > 0.1*Rmax && R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
                result(i,j) = 1;
                counter = counter+1;
            end;
        end;
end;

[posc, posr] = find(result == 1);
counter ;
imshow(image);
hold on;
plot(posr,posc,'r.');

%end