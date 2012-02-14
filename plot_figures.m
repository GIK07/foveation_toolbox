figure(1);
[e,f] = meshgrid(eccentricity( linspace(-256,256,400), 512, 3 ), linspace(0,40,400));
colormap('gray');
imagesc( [-256 256], [0 40], contrast_sensitivity(f,e) );
hold on;
plot( linspace(-256,256,400), cutoff_frequency( eccentricity( linspace(-256,256,400), 512, 3 ) ), 'w' );
set(gca,'ydir','normal');

figure(2);
I = double(rgb2gray(imread('lighthouse2.bmp')));
qmf = MakeONFilter('Daubechies',8);
wc = FWT2_PO( I, 7, qmf );

[LL,LH,HL,HH] = construct_dwt_masks(size(I,1),2);

wc(LL) = uint8( 255 * abs(wc(LL)) / max(max(abs(wc(LL)))) );
for i = 1:2
    wc(LH{i}) = 255 * abs(wc(LH{i})) / max(max(abs(wc(LH{i}))));
    wc(HL{i}) = 255 * abs(wc(HL{i})) / max(max(abs(wc(HL{i}))));
    wc(HH{i}) = 255 * abs(wc(HH{i})) / max(max(abs(wc(HH{i}))));
end
imshow(uint8(wc));

xf = [100 256];
xfs = [75 275;352 104];
N = 4000;
v = 1;
I = rgb2gray(imread('lighthouse2.bmp'));
Is = spatial_foveation_filter(I,N,v,xf,20);
Ism = spatial_foveation_filter(I,N,v,xfs,20);

figure(3);
imshow(Is);
figure(4);
imshow(Ism);
