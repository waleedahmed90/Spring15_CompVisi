%%%%%%%%%%%part(a)%%%%%%%%%%%%%%%%%%%%
A = imread('sample.jpg');   %reading a 100x100 grayscale image from a file
A = rgb2gray(A);    %converting into grayscale image from RGB
size(A);        %100x100
A = sort(A(:),'descend');   %makes it in a list and then sorts descendingly
ListA = A';
%%%%%%%%%%%part(b)%%%%%%%%%%%%%

figure(1); hist(double(A),20);  %plotting a histogram with bin 20

%%%%%%%%%%part(c)%%%%%%%%%%%%%%%%%%%

A = imread('sample.jpg');
t= 127; %defining a threshold value to 127

C1=zeros(100,100,3);


for i=1:100
    for j=1:100
        if A(i,j,1:2:3)>t
            C1(i,j,1) = 255;
        else
            C1(i,j,:) = 0;
        end
    end
end
    
figure(2); imshow(C1)

%%%%%%%%%%%%%part(d)%%%%%%%%%%%%%%%%

X = C1 (50:100,1:50,:);

figure(3); imshow(X)


%%%%%%%%%part(e)%%%%%%%%%%%%%%

%subtracting mean value of list A from all the values in X

E = imread('sample.jpg');
E = abs(E - mean(ListA));

figure(4); imshow(E)


%%%%%%%%%%%%%%%part(f)%%%%%%%%%%%%%%%%%%%%
die = ceil(rand()*6);  %to make an inclusive interval containing 1,2,3,4,5,6

%%%%%%%%%%%%%%%%%part(g)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = [1 2 3 4 5 6];
y = reshape(y,2,3);
y

%%%%%%%%%%%%%%%%%%%part(h)%%%%%%%%%%%%%%%%%%%%%%%%%%(incomplete)
%A = magic(5);
%x =max(max(A));      %that will find a vector containing max from every column

%A
%[r,c] = find (A,max(max(A)));

%x
%r
%c

%%%%%%%%%%%%%%%%%%%%part(g)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
v = [1 8 8 2 1 3 9 8];
x = sum(v == 1)



%%%%%%%%%%%%%%%%%%%%part(h)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=magic(5);
A
x = max(A(:));
[r,c] = find(A == max(A(:)));

x
r
c


%%%%%%%%%%%%%%%%%%%%part(i)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

