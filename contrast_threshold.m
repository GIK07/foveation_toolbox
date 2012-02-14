function [ CT ] = contrast_threshold( f, e )
%CONTRASTTHRESHOLD Calculates the contrast threshold
%   f - frequency measured in cycles per degree
%   e - eccentricity measured in degrees
%   CT - The contrast that is just barely visible

CT0 = 1/64;

e2 = 2.3;

alpha = 0.106;

CT = CT0 * exp( alpha * f .* ( abs(e) + e2 ) / e2 );

end

