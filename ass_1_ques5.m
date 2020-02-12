funny_animal = imread('funnyanimal.jpg');

solver = funny_animal;


solver(:,:,1) = (solver(:,:,1)+solver(:,:,2)+solver(:,:,3))/3;

solver(:,:,2) = (solver(:,:,1)+solver(:,:,2)+solver(:,:,3))/3;

solver(:,:,3) = (solver(:,:,1)+solver(:,:,2)+solver(:,:,3))/3;


imwrite(solver,'funnyanimal_res.jpg');