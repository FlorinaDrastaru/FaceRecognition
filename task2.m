function task2()
  %TODO
  s = [];
  A = [];
  A = double(imread("D:/tema2/checker_tema2/in/images/image3.gif"));
  [m n] = size(A)
  [U S V] = svd(A);
  s = diag(S);
  figure(1);
  plot(s);  
  
  A_k =[];
  [m n] = size(A);
  [U S V] = svd(A);
  info = [];
  for k = 1 : min(m,n)
    sum1 = 0;
    sum2 = 0;
    for i = 1 : k
      sum1 = sum1+S(i,i);
    endfor
    for j = 1 : min(m, n)
      sum2 = sum2 + S(j, j);
    endfor
    info(k) = sum1/sum2; 
  endfor
  figure(2);
  plot(info);
  
  error = [];
  for k = 1 : min(m, n)
    A_k = task1("D:/tema2/checker_tema2/in/images/image3.gif", k);
    error(k) = mean((A(:)-A_k(:)).^2);
  endfor;
  figure(3);
  plot(error);
  
  compr = [];
  for k = 1: min(m, n)
      compr(k) = (m * k + n * k + k)/(m * n);
  endfor
  figure(4);
  plot(compr);
    
end