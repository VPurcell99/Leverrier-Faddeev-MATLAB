function [coeff,inv] = fadeevLaverrier(A)
%
% fadeevLaverrier 
% Function to generate characteristic polynomial of a given MATRIX A 
% as well as the inverse of A without extra computational power.
%
[n,m]=size(A);
coeff = ones(1,n+1);

B = A;
temp = zeros(n,m);
for i = 2:n
    temp = B;
    % Take negative sum of eigenvalues of B divided by n-1
    % to get coeff of increment i
    coeff(i) = -trace(temp)/(i-1);
    % Calculate new eigenvalue diagonal and set to B
    B = A*(temp+coeff(i)*eye(n));
end
% Take negative sum of eigenvalues of B divided by n
coeff(n+1) = -trace(B)/n;
% Get Inverse of original function at no extra cost to computation time
inv=-(temp+coeff(n)*eye(n))/coeff(n+1);

%Prints Results of algorithm
poly_string = dispPolynomial(coeff);
fprintf("Test Matrix:\n");
disp(A);
fprintf('Coefficient Vector:\n');
disp(coeff);
fprintf('Polynomial of Matrix:\n');
fprintf(poly_string);
fprintf('\n\nInverse of Matrix:\n');
disp(inv);