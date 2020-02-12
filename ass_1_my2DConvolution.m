function[r,c]=my2DConvolution[I,M]

newI=zeros(r,c);

for i=2:r-1
    for j=2:c-1
        newI(i,j)= floor((( (M(1,1)*I(i-1,j-1)) + (M(1,2)*I(i-1,j)) + (M(1,3)*I(i-1,j+1)) + (M(2,1)*I(i,j-1)) + (M(2,2)*I(i,j)) + (M(2,3)*I(i,j+1)) + (M(3,1)*I(i+1,j-1)) + (M(3,2)*I(i+1,j)) + (M(3,3)*I(i+1,j+1)) ) )/9);
    end    
end

newI;

end
