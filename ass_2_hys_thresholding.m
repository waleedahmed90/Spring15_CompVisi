function im_hys = hys_thresholding(im_nms,t_high, t_low)

  %pad the matrix with zeros to help in dealing with end points of image
  im_nms = padarray(im_nms, [1 1]); 
  
  %set all elements above t_high to 1 and below t_low to 0
  im_nms(im_nms > t_high) = 1;
  im_nms(im_nms < t_low) = 0;
  
  %set all elements between t_high and t_low to 1 if they are
  %adjacent to 1, 0 otherwise
  
  lastrow = size(im_nms, 1) - 1;
  lastcolumn = size(im_nms, 2) - 1;
  for i = 2:lastrow
    for j = 2:lastcolumn
      if (im_nms(i, j) >= t_low && im_nms(i, j) <= t_high)
        
        if ( im_nms(i  , j+1) == 1 || im_nms(i  , j-1) == 1 ... 
          || im_nms(i+1, j  ) == 1 || im_nms(i-1, j  ) == 1 ...
          || im_nms(i+1, j+1) == 1 || im_nms(i+1, j-1) == 1 ...
          || im_nms(i-1, j+1) == 1 || im_nms(i-1, j-1) == 1 )
        
          im_nms(i, j) = 1;
        else
          im_nms(i, j) = 0;
        end
        
      end %end if
    end %end for
  end %end for
  
  im_hys = im_nms(2:lastrow, 2:lastcolumn);

end