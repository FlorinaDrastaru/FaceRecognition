function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
  min_dist = [];
  vcol = [];
  dist = [];
  A = double(rgb2gray(imread(image_path)));
  %transform matricea in vector coloana
  vcol = A(:);
  [lin col] = size(vcol);
  A = vcol - m';
  pr = eigenfaces' * A;
  %calculez distantele si le concatenez la vectorul dist
  for i = 1 : size(eigenfaces, 2)
    d = norm(pr - pr_img(:, i));
    dist = [dist d];
  endfor
  [min_dist output_img_index] = min(dist);
end