%%

naive=[0,0,0;...
      0,1,0;...
      0,0,0];
  
size=5;
gauss=fspecial('gaussian',size);

aname='20171116-225257.TIFF';
ename='20171116-225352.TIFF';
%%
actual=imread(aname);
expected=imread(ename);
%Do histograms 
%Do low ISO things
%%
%Test image, RAW before, RAW after, Processed gauss, Processed naive
 



actual=abs((imread(aname)));
expected=abs((imread(ename)));
% %%
% se = strel('square',3);
% imshow(imerode(expected,se));
% figure
% imshow(imdilate(expected,se))
%%

%blurred=imfilter(actual,gauss);
afilt=(imfilter(actual,naive));
efilt=(imfilter(expected,naive));
%out=idiff(efilt,afilt);
out=(max(afilt,efilt)-min(afilt,efilt));
%out=efilt-afilt;
%out2=(imfilter(actual,gauss)-imfilter(expected,gauss));
%%
close all
imshow(out);
%figure
%imshow(out2);

%%
%imwrite(out2,strcat('gaussiancolorcompare-',aname));
imwrite(out,strcat('naivecolorcompare-',aname));

%%
function[imagediff]=idiff(img1,img2)
a=img1-img2;
b=img2-img1;
c=(img1>img2);
a=a.*uint8(c);
b=b.*uint8(~c);

imagediff=a+b;
end
