
function prog2(im1, im2)

imshow(im1)                
[pointx,pointy] = getpts() ;        

imshow(im2)                
[x,y] = getpts()  ;     

s = size(y,1);             
c=s+s;
matrixA=zeros(c,6)  ; 
matrizB=zeros(c,1) ;   

j=1;
for i=1 :2: c
       matrixA(i,1) = pointx(j);
       matrixA(i,2) = pointy(j);
       matrixA(i,3) = 1;
       matrixA(i,4) = 0;
       matrixA(i,5) = 0;
       matrixA(i,6) = 0;
       matrixA(i+1,1) = 0;
       matrixA(i+1,2) = 0;
       matrixA(i+1,3) = 0;
       matrixA(i+1,4) = pointx(j);
       matrixA(i+1,5) = pointy(j);
       matrixA(i+1,6) = 1;
       j = j+1;
end



j=1;
for i=1:2 : c              
   
       matrizB(i,1) = x(j);
       matrizB(i+1,1) = y(j);
       j = j+1;

end

trans = transpose(matrixA);  
result = inv(trans*matrixA)*(trans*matrizB)

end