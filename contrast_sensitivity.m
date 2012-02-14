function [ CS ] = contrast_sensitivity( f, e )
%CONTRAST_SENSITIVITY Calculates the contrast sensitivity
%   f - frequency measured in cycles per degree
%   e - eccentricity measured in degrees
%   CS - the contrast sensitivity

CS = 1 ./ contrast_threshold( f, e );

end

