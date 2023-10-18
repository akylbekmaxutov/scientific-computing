clc;
clear all;

x = [1.0, 1.1, 1.3, 1.5, 1.9, 2.1]; 
y = [1.84, 1.96, 2.21, 2.45, 2.94, 3.18];

% singular value decomposition method 
% to find the linear least squares polynomial of degree 2.
n = length(x);
A = [x'.^2, x', ones(n, 1)];

[U, S, V] = svd(A, 0);
coefficients = V * (S \ (U' * y'));

% y = a*x^2 + b*x + c
a = coefficients(1);
b = coefficients(2);
c = coefficients(3);

y_pred = a * x.^2 + b * x + c;
lse = (y - y_pred);
sse = sum(lse.^2);

% Display the coefficients and SSE
fprintf('Coefficients: a = %.4f, b = %.4f, c = %.4f\n', a, b, c);
disp('Least Squares Error')
disp(lse)
fprintf('Sum of Least Squares Errors (sse): %.4f\n', sse);

disp('U: ');
disp(U);
disp('S: ');
disp(S);
disp('V: ');
disp(V);

% singular value decomposition method 
% to find the linear least squares polynomial of degree 3.
n = length(x);
A = [x'.^3, x'.^2, x', ones(n, 1)];

[U, S, V] = svd(A, 0);
coefficients = V * (S \ (U' * y'));

% y = a*x^3 + b*x^2 + c*x + d
a = coefficients(1);
b = coefficients(2);
c = coefficients(3);
d = coefficients(4);

y_pred = a * x.^3 + b * x.^2 + c * x + d;
lse = (y - y_pred);
sse = sum(lse.^2);

% Display the coefficients and SSE
fprintf('Coefficients: a = %.4f, b = %.4f, c = %.4f, d = %.4f\n', a, b, c, d);
disp('Least Squares Error')
disp(lse)
fprintf('Sum of Least Squares Errors (sse): %.4f\n', sse);

disp('U: ');
disp(U);
disp('S: ');
disp(S);
disp('V: ');
disp(V);