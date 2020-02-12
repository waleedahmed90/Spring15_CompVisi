I = (rgb2gray(imread('image005.jpg')));

M = [1 1 1;1 1 1;1 1 1];

[r,c]=size(I);

newI=zeros(r,c);

temp=zeros(3,3);


for i=2:r-1
    for j=2:c-1
        temp(1,1)=M(1,1)*I(i-1,j-1);
        temp(1,2)=M(1,2)*I(i-1,j);
        temp(1,3)=M(1,3)*I(i-1,j+1);
        temp(2,1)=M(2,1)*I(i,j-1);
        temp(2,2)=M(2,2)*I(i,j);
        temp(2,3)=M(2,3)*I(i,j+1);
        temp(3,1)=M(3,1)*I(i+1,j-1);
        temp(3,2)=M(3,2)*I(i+1,j);
        temp(3,3)=M(3,3)*I(i+1,j+1);
        newI(i,j) = median(temp(:));
    end    
end

imwrite(newI,'noisypic_res_mean.jpg');
