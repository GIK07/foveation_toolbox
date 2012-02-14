function [ score ] = fwqi( I, Ip, N, v, xf, L )
%FWQI Calculates the foveated wavelet quality index
%   I - the reference image
%   Ip - the distorted image
%   N - the pitch or density of the pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation points
%   L - the number of wavelet decomposition levels
%   score - the FWQI score

S = size(I,1);

sf = wavelet_contrast_sensitivity(S,L,N,v,xf);

qmf = MakeONFilter('Daubechies',8);
wc = FWT2_PO( double(I), log2(S)-L, qmf );
wcp = FWT2_PO( double(Ip), log2(S)-L, qmf );

fwd = sqrt( sum(sum((sf.*(wc - wcp)).^2))/numel(wc) );

score = exp(-fwd);

end

