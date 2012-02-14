function [ If ] = dct_foveation_filter( I, N, v, xf, B )
%DCT_FOVEATION_FILTER Performs foveation filtering in
%   the DCT domain
%   I - the reference image
%   N - the pitch or density of the pixels
%   v - the distance of the viewer from the image
%   xf - array of fixation points
%   B - the macro block size
%   If - the foveation filtered image

If = uint8(zeros(size(I)));
S = size(I,1);
NB = S/B;

BM = construct_block_masks(S,B);

for i = 1:NB
    for j = 1:NB
        x = (i-1)*B + B/2;
        y = (j-1)*B + B/2;
        
        d = sqrt( (x-xf(1,1)).^2 + (y-xf(1,2)).^2 );
        for k = 2:size(xf,1)
            d = min( d, sqrt( (x-xf(k,1)).^2 + (y-xf(k,2)).^2 ) );
        end
        
        e = eccentricity(d,N,v);
        fc = cycles_per_pixel(cutoff_frequency(e),N,v);
        
        kc = floor(2*fc*B);        
        wk = 1:B;
        wk(wk<=kc) = 1;
        wk(wk==kc+1) = 0.5;
        wk(wk>kc+1) = 0;
        Wk = wk'*wk;
        
        cc = dct2(reshape(I(BM{i,j}),B,B));
        
        If(BM{i,j}) = idct2(cc .* Wk);                
    end
end

end

