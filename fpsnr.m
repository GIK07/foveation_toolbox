function [ score ] = fpsnr( I, Ip, N, v, xf )
%FPSNR Calculates the foveated peak signal to noise ratio
%   I - the reference image
%   Ip - the distorted image
%   N - the pitch or density of the pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation points
%   score - the FPSNR score

score = 10 * log10( 255 / fmse(I,Ip,N,v,xf) );

end

