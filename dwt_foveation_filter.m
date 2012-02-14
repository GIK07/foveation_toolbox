function [ If ] = dwt_foveation_filter( I, N, v, xf, L )
%DWT_FOVEATION_FILTER Performs foveation filtering in
%   the wavelet domain
%   I - the reference image
%   N - the pitch or density of the pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation points
%   L - number of wavelet decomposition levels
%   If - the foveation filtered image

S = size(I,1);

qmf = MakeONFilter('Daubechies',8);
wc = FWT2_PO( double(I), log2(S)-L, qmf );

sf = dwt_contrast_sensitivity(S,L,N,v,xf);

wcf = sf .* wc;

If = uint8(IWT2_PO( wcf, log2(S)-L, qmf ));

end

