% Takes a input coefficient vector and returns a string that can display
% the function for the Matlab Publisher

function [poly_string] = dispPolynomial(vec)
    lambda_num = size(vec,2)-1;
    poly_string = "\x03bb^" + num2str(lambda_num);
    for i = 2:size(vec,2)
       lambda_num = size(vec,2)-i;
       poly_string = poly_string + " + " + num2str(vec(i)) + "\x03bb^" + num2str(lambda_num);
    end
end