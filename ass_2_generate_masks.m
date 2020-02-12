% Computes kernel size and generate masks

function [fx, fy] = generate_masks(sigma)

  %Compute kernel
  T = 0.1; % Threshold.
  kernel = 2 * round( sqrt(-2*sigma*sigma*log(T)) ) + 1;
  
  %Generate gaussian mask
  mask_gaussian = fspecial('gaussian', kernel, sigma);
  
  %Differentiate gaussian mask using Sobel filter
  sobelx = [-1 0 1; -2 0 2; -1 0 1];
  sobely = [1 2 1; 0 0 0; -1 -2 -1];
  fx=imfilter(mask_gaussian, sobelx, 'conv');
  fy=imfilter(mask_gaussian, sobely, 'conv');
  
  % Write masks to text files
  dlmwrite('maskfx.txt', fx, 'delimiter', '\t', 'precision', '%.6f');
  dlmwrite('maskfy.txt', fy, 'delimiter', '\t', 'precision', '%.6f');
  
end