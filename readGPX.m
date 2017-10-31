% Copyright (c) 2016 by Brian DiZio <brian.a.dizio@gmail.com>
% Permission is NOT granted for all other uses -- please contact the author for details

% This code was provided for our use.  I (Brian DiZio) did not
% write it -- but the entire project will not make sense if This
% is not included

function [lats,lons,els,ts]=readGPX(filename)
% Read a GPS track in GPX format
%
% function [lats,lons,els,ts]=readGPX(filename)
%
% Input: filename = GPX file to read
% Output: lats = vector of latitudes in track (degrees)
%         lons = vector of longitudes in track (degrees)
%         els  = vector of elevations in track (meters)
%         ts   = vector of times in track (seconds)

% Format of the file we're interested amounts to three lines per sample
% first with lat, lon, then elevation, followed by timestamp

% Open the file
fp=fopen(filename,'rt');

line=fgetl(fp);
i=1;
while( line > 0 )
  idx=find(line=='<',1);
  line(1:idx-1)=[];  
  if( length(line) > 5 )
    switch( line(1:5) )
      case {'<trkp'}
	a=sscanf(line,'<trkpt lat=\"%f\" lon=\"%f\">');
	lats(i)=a(1);
	lons(i)=a(2);
      case {'<ele>'}
	a=sscanf(line,'<ele>%f');
	els(i)=a;	 
      case {'<time'}
	a=sscanf(line(7:end-7),'%d-%d-%dT%d:%d:%d');	 
	ts(i)=a(4)*3600+a(5)*60+a(6);	 
	i=i+1;
     end
   end
   line=fgetl(fp);
end

% Close the file
fclose(fp);
