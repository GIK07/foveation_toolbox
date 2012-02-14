function [ score ] = fmse( I, Ip, N, v, xf )
%FMSE Calculates the foveated mean squared error
%   I - the reference image
%   Ip - the distorted image
%   N - the pitch or density of the pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation points
%   score - the FMSE score

r = I - Ip;

[x,y] = meshgrid(1:size(I,1),1:size(I,2));
d = sqrt( (x-xf(1)).^2 + (y-xf(2)).^2 );
e = eccentricity( d, N, v );
fc = cutoff_frequency( e );

score = sum(sum(r.^2 .* fc.^2)) / sum(sum(fc.^2));

end

