%this function applies x and y masks on the images to calculate the
%gradient
function [im_fx, im_fy, im_mag] = gradient_magnitude(im, fx, fy)
  im_fx = imfilter(im, fx, 'conv');
  im_fy = imfilter(im, fy, 'conv');
  im_mag = sqrt(im_fx .^ 2 + im_fy .^ 2);
  
  % Write images after normalizing them to [0 1]
 temp1=normalize_matrix(im_fx);
 temp2=normalize_matrix(im_fy);
 temp3=normalize_matrix(im_mag);
  
  imwrite(temp1,'imfx.png');%filtering image with x mask
  imwrite(temp2,'imfy.png');%filtering image with y mask
  imwrite(temp3,'immag.png');%gradmagnitude image
end