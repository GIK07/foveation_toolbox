function [ fc ] = cutoff_frequency( e )
%CUTOFF_FREQUENCY Calculates the cutoff frequency
%   e - eccentricity measured in degrees
%   fc - the cutoff frequency

CT0 = 1/64;

e2 = 2.3;

alpha = 0.106;

fc = ( e2 * log( 1/CT0 ) ) ./ ( alpha * ( abs(e) + e2 ) );

end

