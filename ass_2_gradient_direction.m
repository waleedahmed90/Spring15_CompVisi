% Returns the quantized gradient direction, with values
% consisting of 1, 2, 3 or 4, representing a general direction.

function im_direction = gradient_direction(im_fx, im_fy, im_mag)
% im_fx is the image convolved with fx.
% im_fy is the image convolved with fy.
% im_mag is the gradient magnitude
  
  im_direction = atan2(im_fy, im_fx);
  
  % Converting from radians to degrees in the range 0 - 360
  im_direction = im_direction * (180 / pi);
  im_direction(im_direction < 0) = im_direction(im_direction < 0) + 360;
  
  % Saving the image
  direction_image('image_direction', im_direction, im_mag, 0.1);
  
  % Quantizing the directions
  % East - West
  im_direction(im_direction >= 000.0 & im_direction <= 022.5) = 1;
  im_direction(im_direction >  337.5 & im_direction <= 360.0) = 1;
  im_direction(im_direction >  157.5 & im_direction <= 202.5) = 1;
  
  % Northeast - Southwest
  im_direction(im_direction >  022.5 & im_direction <= 067.5) = 2;
  im_direction(im_direction >  202.5 & im_direction <= 247.5) = 2;
  
  % North - South
  im_direction(im_direction >  067.5 & im_direction <= 112.5) = 3;
  im_direction(im_direction >  247.5 & im_direction <= 292.5) = 3;
  
  % Southeast - Northwest
  im_direction(im_direction >  112.5 & im_direction <= 157.5) = 4;
  im_direction(im_direction >  292.5 & im_direction <= 337.5) = 4;
  
  % Saving the quantized image
  % Saves images of non-quantized and quantized gradient direction
  direction_image('image_direction_quantized', im_direction, im_mag, 0.1);
  
end