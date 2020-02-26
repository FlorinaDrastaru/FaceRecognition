function A_k = task1(image, k)
  %TODO
  %citesc imaginea data ca matrice
  A = double(imread(image));
  [m n] = size(A);
  %fac descompunerea valorilor singulare
  [U S V] = svd(A);
  %reduc matricile obtinute la dimensiunile de 
  %k coloane si m, k, respectiv n linii
  U_k = U(1 : m, 1 : k);
  S_k = S(1 : k, 1 : k);
  V_k = V(1 : n, 1 : k);
  A_k = U_k * S_k * V_k';
  %imshow(uint8(A_k));
end