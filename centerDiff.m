% Copyright (c) 2016 by Brian DiZio <brian.a.dizio@gmail.com>
% Permission is NOT granted for all other uses -- please contact the author for details

function derivative=centerDiff(f,h)
% Compute derivative of a function specified at equally-spaced points
%
% derivative=centerDiff(f,h)
%
% Input: f = vector of function values
%        h = spacing between adjacent datapoints
% Output: derivative = estimate of derivative at datapoints

derivative=0;

for i=2:length(f)-1
derivative(i-1)=(f(i+1)-f(i-1))/(2*h);
end

% The derivative will be shorter than f by one data point, because of how 
% we started calculating the derivative with the difference between the
% first two points in f.

