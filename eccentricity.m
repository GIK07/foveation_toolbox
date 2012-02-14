function [ e ] = eccentricity( d, N, v )
%ECCENTRICITY calculates eccentricity in degrees
%   d - distance to fixation point measured in pixels
%   N - the pitch or density of the pixels
%   v - distance of the viewer from the image
%   e - eccentricity measured in degrees

e = atan( d / ( N*v ) ) * 180 / pi;

end

