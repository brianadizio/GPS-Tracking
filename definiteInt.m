% Copyright (c) 2016 by Brian DiZio <brian.a.dizio@gmail.com>
% Permission is NOT granted for all other uses -- please contact the author for details

function integral=definiteInt(f,h)
%
% Estimate a definite integral using Simpson?s rule
%
% Input: f = vector of function values
%        h = spacing between adjacent datapoints
% Output: integral = estimate of the integral

integral = 0;

for i=1:2:length(f)-2
    integral = integral + (h/3)*(f(i)+4*f(i+1)+f(i+2));
end