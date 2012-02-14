function [ LL,LH,HL,HH ] = construct_dwt_masks( S, L )
%CONSTRUCT_DWT_MASKS Constructs masks for indexing wavelet
%   decomposition levels
%   S - size of the image / wavelet domain
%   L - the number of decomposition levels
%   LL - LL decomposition level mask
%   LH, HL, HH - arrays of LH, HL, and HH decomposition
%       level masks. the ith element of the array
%       corresponds to the ith decomposition level

n = log2(S);
[x,y] = meshgrid(1:S,1:S);

LL = x <= 2^(n-L) & y <= 2^(n-L);
LH = cell(n,1);
HL = cell(n,1);
HH = cell(n,1);

for i = 1:n
    m1 = x > 2^(n-i);
    m2 = x <= 2^(n-i+1);
    m3 = y > 2^(n-i);  
    m4 = y <= 2^(n-i+1);
    
    LH{i} = ~m1 & m3 & m4;
    HL{i} = m1 & m2 & ~m3;    
    HH{i} = m1 & m2 & m3 & m4;
end

end

