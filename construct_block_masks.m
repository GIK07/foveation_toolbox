function [ BM ] = construct_block_masks( S, B )
%CONSTRUCT_BLOCK_MASKS Constructs block masks for
%   accessing macro blocks in an image.
%   S - the image size
%   B - the block size
%   BM - an array of block masks for each block

[x,y] = meshgrid(1:S, 1:S);

NB = S/B;

BM = cell(NB);
for i = 1:NB
    m1 = x > B*(i-1) & x <= B*i;
    for j = 1:NB
        m2 = y > B*(j-1) & y <= B*j;
        BM{i,j} = m1 & m2;        
    end
end

end

