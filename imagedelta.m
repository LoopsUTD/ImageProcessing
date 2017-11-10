%%

naive=[0,0,0;...
      0,1,0;...
      0,0,0];
  
size=5;
gauss=fspecial('gaussian',size);

aname='lcd-171109-3-h-04-y-0001.png';
ename='lcd-171109-3-h-04-n-0001.png';
%%
actual=imread(aname);
expected=imread(ename);
%%
%Test image, RAW before, RAW after, Processed gauss, Processed naive

actual=imbinarize(rgb2gray(imread(aname)));
expected=imbinarize(rgb2gray(imread(ename)));
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

%%
imwrite(out2,strcat('gaussiancolorcompare-',aname));
imwrite(out,strcat('naivecolorcompare-',aname));

%%
h3=imread(strcat('gaussiancolorcompare-',aname));

%%
hipass=max(h3,v3);
imshow(hipass);
imwrite(hipass,'hipass_lens3.png');