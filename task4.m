function [A_k S] = task4(image, k)
   %TODO
  niu = [];
  Z = [];
  W = [];
  A_k=[];
  T = [];
  A = double(imread(image));
  [m n] = size(A);
  for i = 1 : m
    s = 0;
    for j = 1 : n
      s = s + A(i,j);
    endfor
    niu(i) = s / n;
  endfor
  for i = 1 : m
    A(i, :) = A(i, :) - niu(i);
  endfor
  Z = A * (A' * 1 / (n - 1));
  [V S] = eig(Z);
  W = V(:, 1 : k);
  Y = W' * A;
  T = W * Y;
  for i = 1 : m
    A_k(i, :) = T(i, :) + niu(i);
  endfor
  %imshow(uint8(A_k));
endfunction