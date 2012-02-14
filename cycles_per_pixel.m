function [ fp ] = cycles_per_pixel( fd, N, v )
%CYCLES_PER_PIXEL Converts cycles per degree to cycles per pixel
%   fd - frequency measured in cycles per degree
%   N - the pitch or density of the pixels
%   v - distance of the viewer from the image
%   fp - frequency measured in cycles per pixel

fp = 180 * fd / ( pi * N * v );

end

