

image_in = 'chriswaltz.jpg';  % The image
%image_in = 'house.jpg';  % The image
%image_in = 'lighthouse.jpg';  % The image
%image_in = 'KKH.jpg';  % The image
%image_in = 'armacost.jpg';  % The image
sigma = 1.5; % for Gaussian filtering

im = im2double( imread(image_in) );
im_canny = canny_detector(im, sigma);
imwrite(im_canny, 'im_final.png');