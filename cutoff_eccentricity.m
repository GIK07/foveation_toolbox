function [ ec ] = cutoff_eccentricity( f )
%CUTOFF_ECCENTRICITY Calculates the cutoff eccentricity
%   f - frequency measured in cycles per degree
%   ec - the cutoff eccentricity

CT0 = 1/64;

e2 = 2.3;

alpha = 0.106;

ec = e2 / ( alpha * f ) * log( 1/CT0 ) - e2;

end

