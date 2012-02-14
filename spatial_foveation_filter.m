function [ If ] = spatial_foveation_filter( I, N, v, xf, b )
%SPATIAL_FOVEATION_FILTER Performs foveation filtering in
%   the spatial domain
%   I - the reference image
%   N - the pitch or density of the pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation points
%   b - number of discrete cutoff frequency levels
%   If - the foveation filtered image

S = size(I,1);
[x,y] = meshgrid(1:S,1:S);

d = sqrt( (x-xf(1,1)).^2 + (y-xf(1,2)).^2 );
for i = 2:size(xf,1)
    d = min( d, sqrt( (x-xf(i,1)).^2 + (y-xf(i,2)).^2 ) );
end

e = eccentricity( d, N, v );
fc = cycles_per_pixel( cutoff_frequency(e), N, v );

bins = linspace( min(fc(:)), max(fc(:)), b+1);

If = I;
for i = 1:b
    BW = (fc >= bins(i)) & (fc <= bins(i+1));
    sigma = 2*sqrt(2*log(2))/(2*pi*bins(i));
    h = fspecial('gaussian',[50 50],sigma);
    If = roifilt2(h,If,BW);    
end

end

