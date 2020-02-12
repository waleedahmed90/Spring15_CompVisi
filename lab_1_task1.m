I = im2double(rgb2gray(imread('funnyanimal.jpg')));
M = 1/9 * [1 1 1;1 1 1;1 1 1];

newI = conv2(I,M);

imwrite(newI,'funnyanimal_conv_res1.jpg');

newI2 = filter2(M,I, 'full');

imwrite(newI2,'funnyanimal_conv_res2.jpg');