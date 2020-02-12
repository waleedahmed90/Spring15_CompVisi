% Returns matrix after applying non maximum suppression on im_mag

function suppressed_matrix = nonmax_suppression(im_mag, im_direction)
  im_mag = padarray(im_mag, [1 1]);
  im_direction = padarray(im_direction, [1 1]);
  
  lastrow = size(im_mag, 1) - 1;
  lastcolumn = size(im_mag, 2) - 1;
  
  % Make a new matrix of same size as im_mag to save the result in
  mat_new = zeros(size(im_mag, 1), size(im_mag, 2));

  % Setting values to 1 on strong edges and zero at other places
  
  for i = 2:lastrow
    for j = 2:lastcolumn
      if im_direction(i, j) == 1 % East - West
        if (im_mag(i,j) > im_mag(i, j+1) && im_mag(i,j) > im_mag(i, j-1))
          mat_new(i, j) = im_mag(i, j);
        end
      elseif im_direction(i, j) == 2 % Northeast - Southwest
        if (im_mag(i,j) > im_mag(i+1, j-1) && im_mag(i,j) > im_mag(i-1, j+1))
          mat_new(i, j) = im_mag(i, j);
        end
      elseif im_direction(i, j) == 3 % North - South
        if (im_mag(i,j) > im_mag(i+1, j) && im_mag(i,j) > im_mag(i-1, j))
          mat_new(i, j) = im_mag(i, j);
        end
      elseif im_direction(i, j) == 4 % Southeast - Northwest
        if (im_mag(i,j) > im_mag(i+1, j+1) && im_mag(i,j) > im_mag(i-1, j-1))
          mat_new(i, j) = im_mag(i, j);
        end
      end % end if
    end % end for
  end % end for
  
  %removing the padded zeros
  suppressed_matrix = mat_new(2:lastrow, 2:lastcolumn);
  
  %save the result
  imwrite( normalize_matrix(suppressed_matrix), 'im_nonMaxima.png' );
  
end