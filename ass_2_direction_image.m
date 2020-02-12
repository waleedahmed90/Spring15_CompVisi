% This function saves the gradient direction image by filtering out values
% in im_direction whose corresponding values in im_mag are less than t.

function direction_image(output_file_name, im_direction, im_mag, t)
  % thresholding
  im_direction(im_mag < t) = -1; 
  % generate image
  f = figure;
  imagesc(im_direction);
  colorbar;
  print(output_file_name, '-dpng');
  close(f);

end