puzzle = imread('puzzle.jpg');

solver = puzzle;

solver (:,:,2:3) = 0;   %removing green and blue color channels
solver (:,:,1) = solver(:,:,1) *10; %brightening the red channel

imshow(solver);

imwrite(solver,'puzzle-res.jpg');