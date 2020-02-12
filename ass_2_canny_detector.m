% im is image
% sigma is in range[0.4 - 4.0] 
function canny_im = canny_detector(im, sigma)
  
  % Convert image to grayscale
  [dim_x, dim_y, dim_z] = size(im);
  if dim_z > 1
    im = rgb2gray(im);
  end
  [fx, fy] = generate_masks(sigma);% masks generation
  
  [im_fx, im_fy, im_mag] = gradient_magnitude(im, fx, fy); % calculate the gradient magnitude

  im_direction = gradient_direction(im_fx, im_fy, im_mag); % Compute gradient direction
 
  im_nms = nonmax_suppression(im_mag, im_direction); % Apply non maximum suppression and save the resulting image
  
  t_high = mean(im_mag(:)); % Apply hystersis thresholding and return final result
  t_low  = 0.4 * t_high;
 
  canny_im = hys_thresholding(im_nms, t_high, t_low);
  
end