function task5()
  %TODO
  A_k = [];
  S = [];
  A= double(imread("D:/tema2/checker_tema2/in/images/image2.gif"));
  [m n] = size(A);
  k = linspace(100, 30, min(m, n));
  [A_k S] = task3("D:/tema2/checker_tema2/in/images/image2.gif", k);
  [U S V] = svd(A);
  figure(1);
  plot(diag(S));
  
  niu = [];
  for i = 1 : m
    s = 0;
    for j = 1 : n
      s = s + A(i, j);
    endfor
    niu(i) = s / n;
  endfor
  for i = 1 : m
    A(i, :) = A(i, :) - niu(i);
  endfor
  Z = A' / sqrt(n - 1);
  [U1 S1 V1] = svd(Z);
  info = [];
  [x y] = size(Z);
  for k = 1 : min(m, n)
    sum1 = 0;
    sum2 = 0;
    for i = 1 : k
      sum1 = sum1 + S1(i, i);
      endfor
      for j = 1 : min(x, y)
        sum2 = sum2 + S1(j, j);
      endfor
    info(k) = sum1 / sum2; 
  endfor
  figure(2);
  plot(info);
  
  error = [];
  for k = 1 : min(m, n)
    A_k = task1("D:/tema2/checker_tema2/in/images/image2.gif", k);
    error(k) = mean((A(:) - A_k(:)).^2);
  endfor;
  figure(3);
  plot(error);
  
  compr = [];
  for k = 1 : min(m, n)
    compr(k) = (2 * k + 1) / n;
  endfor
  figure(4);
  plot(compr);
  
end