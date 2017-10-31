% Copyright (c) 2016 by Brian DiZio <brian.a.dizio@gmail.com>
% Permission is NOT granted for all other uses -- please contact the author for details

% Convert units
[lats,lons,els,ts]=readGPX('gpstrackA.gpx');
r=6378100; % Radius of earth
lons_m=cos(lats.*pi./180).*pi.*r.*lons./180; % Convert degrees to miles
lats_m=pi*r*lats/180; % Convert degrees to miles
% ts=ts/3600; % Converts to meters per hour

h=1

% Calculate the maximum speed over the distance over the path
A=centerDiff(lats_m,h);
B=centerDiff(lons_m,h);
C=centerDiff(ts,1)
speed=sqrt(A.^2+B.^2)./C;
maxspeed=max(abs(speed))
% 16.793948223786895 meters/second

% Calculate the total distance
distancetraveled = definiteInt(speed,mean(C))
%  7.769641948928277e+03 meters


% Person of interest changed mode of transportation at sum(ts(X:Y)) = 


plot3(lats(find(speed>10)),lons(find(speed>10)),ts(find(speed>10)),'r')
hold on
plot3(lats(find(speed<10)),lons(find(speed<10)),ts(find(speed<10)),'g')
hold off
plot(speed)
% This final plot shows that the POI changed speed at ts=400.  Therefore, 
changeofspeedtime=ts(400)-ts(1);
changeofspeedtime=changeofspeedtime/60
% The POI changed speeds after 29.20 minutes

