%%

naive=[0,0,0;...
      0,1,0;...
      0,0,0];
  
size=5;
gauss=fspecial('gaussian',size,size/3);


actual=imread('i1_freq0p2.png');
expected=imread('stripes.png');
blurred=imfilter(actual,gauss);

out=(imfilter(actual,gauss)-imfilter(expected,naive));
out2=(imfilter(actual,naive)-imfilter(expected,naive));
%%
close all
imshow(out);
figure
imshow(out2);

%%
