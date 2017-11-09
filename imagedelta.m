%%

naive=[0,0,0;...
      0,1,0;...
      0,0,0];
  
size=50;
gauss=fspecial('gaussian',size);

%actual=imread('i1_freq0p2.png');
%expected=imread('stripes.png');

%Test image, RAW before, RAW after, Processed gauss, Processed naive

actual=imbinarize(rgb2gray(imread('greenlines_with_lens3.png')));
expected=imbinarize(rgb2gray(imread('greenlines_no_lens.png')));
% %%
% se = strel('square',3);
% imshow(imerode(expected,se));
% figure
% imshow(imdilate(expected,se))
%%

blurred=imfilter(actual,gauss);

out=(imfilter(actual,gauss)-imfilter(expected,gauss));
out2=(imfilter(actual,naive)-imfilter(expected,naive));
%%
close all
imshow(out);
figure
imshow(out2);

