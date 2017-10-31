% Copyright (c) 2016 by Brian DiZio <brian.a.dizio@gmail.com>
% Permission is NOT granted for all other uses -- please contact the author for details

[lats,lons,els,ts]=readGPX('gpstrackA.gpx');
r=6378100; % Radius of earth
lons_m=cos(lats.*pi./180).*pi.*r.*lons./180; % Convert degrees to miles
lats_m=pi*r*lats/180; % Convert degrees to miles
% ts=ts/3600; % Converts to meters per hour

dlats=lats_m(2:5)

ts=ts(2:5)

dlats=dlats-mean(dlats)
ts=ts-mean(ts)

% See divided difference table written out by hand for calculation of 
% the third derivative.

% Error is 0.095802 meters/second

