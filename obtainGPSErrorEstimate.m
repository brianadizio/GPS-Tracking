% Copyright (c) 2016 by Brian DiZio <brian.a.dizio@gmail.com>
% Permission is NOT granted for all other uses -- please contact the author for details

function GPSerror = paths(L)

% Inputs:
%     MultipathfromDirectPath = L = [L1, L2, ... , L16] (1xL, matrix)
% Outputs:
%    GPSerror = average distance between actual path and GPS path (1x1,
%    matrix)


L = [12.06, 22.33, 20.29, 25.77, 17.98, 17.75, 4.00, 2.28, 8.42, 22.61, 19.43, 14.46, 11.10, 7.14, 19.42]

DirectPath=296.65

GPSerror = mean(L)

end