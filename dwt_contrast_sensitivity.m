function [ sw ] = dwt_contrast_sensitivity( S, L, N, v, xf )
%DWT_CONTRAST_SENSITIVITY Calculates contrast sensitivity projected
%   into the wavelet domain
%   S - size of the image / wavelet domain
%   L - the number of decomposition levels
%   N - the pitch or density of pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation point locations
%   sw - contrast sensitivity in the wavelet domain

n = log2(S);

[LL,LH,HL,HH] = construct_dwt_masks(S,L);

[x,y] = meshgrid(1:S,1:S);

x(LL) = x(LL) * 2^L;
y(LL) = y(LL) * 2^L;
for i = 1:L
    x(HL{i}) = (x(HL{i})-2^(n-i))*2^i;
    y(HL{i}) = y(HL{i})*2^i;
        
    x(LH{i}) = x(LH{i})*2^i;
    y(LH{i}) = (y(LH{i})-2^(n-i))*2^i;
    
    x(HH{i}) = (x(HH{i})-2^(n-i))*2^i;    
    y(HH{i}) = (y(HH{i})-2^(n-i))*2^i;        
end

d = sqrt( (x-xf(1,1)).^2 + (y-xf(1,2)).^2 );
for i = 2:size(xf,1)
    d = min( d, sqrt( (x-xf(i,1)).^2 + (y-xf(i,2)).^2 ) );
end

e = eccentricity(d,N,v);

sw = zeros(size(e));
sw(LL) = 1;
for i = 1:L
    m = HL{i} | LH{i} | HH{i};
    f = cycles_per_degree(2^(-i-1),N,v);
    sw(m) = contrast_sensitivity(f,e(m)) / contrast_sensitivity(f,0);
end

end

