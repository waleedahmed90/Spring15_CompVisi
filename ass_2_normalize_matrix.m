% Normalizes the values in the given matrix to the range [0 1].

function normalized_mat = normalize_matrix(input_matrix)
  normalized_mat = input_matrix - min( input_matrix(:) );
  normalized_mat = normalized_mat / max( normalized_mat(:) );
end