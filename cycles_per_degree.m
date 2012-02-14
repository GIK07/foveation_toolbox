function [ fd ] = cycles_per_degree( fp, N, v )
%CYCLES_PER_DEGREE Converts cycles per pixel to cycles per degree
%   fp - frequency measured in cycles per pixel
%   N - the pitch or density of the pixels
%   v - distance of the viewer from the image
%   fd - frequency measured in cycles per degree

fd = fp * pi * N * v / 180;

end

