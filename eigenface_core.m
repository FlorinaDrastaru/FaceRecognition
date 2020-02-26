function [m A eigenfaces pr_img] = eigenface_core(database_path)
  %TODO
  T = [];
  m = [];
  V = [];
  X = [];
  A=[];
  vcol = [];
  D = dir(database_path);
  for i = 1 : 10
    str = strcat(database_path,'/',int2str(i),'.jpg');
    X = double(rgb2gray(imread(str)));
    [a b] = size(X);
    vcol = X(:);
    T = [T vcol];
  endfor
  [l c] = size(T);
  for i = 1:l
    s = 0;
    for j = 1:c
      s = s + T(i,j);
    endfor
    m(i) = s / c;
  endfor
  
  A = T - m';
  M = [];
  M = A' * A;
  [V S] = eig(M);
  MEig = [];
  %caut valorile proprii mai mari decat 1
  for i = 1 : size(V, 2) 
    if S(i,i) > 1 
        MEig = [MEig V(:,i)];
    end
  end
  eigenfaces = A * MEig;
  pr_img = [];
  for i = 1 : size(eigenfaces, 2)
    pr = eigenfaces' * A(:, i);
    pr_img = [pr_img pr];
  endfor
   
end