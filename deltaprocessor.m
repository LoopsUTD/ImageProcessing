hnm='gaussiancolorcompare-20171116-225305.TIFF';
vnm='naivecolorcompare-20171116-225257.TIFF';
%%
hor=imread(hnm);
vert=imread(vnm);
%%
 
%%
hipass=max(hor,vert);
imshow(hipass);
lowpass=min(hor,vert);
imshow(lowpass);
%%

%%
imwrite(hipass,'hipass_lens3.TIFF');
imwrite(lowpass,'lowpass_lens3.TIFF');
%%
lowpassscaled=lowpass*(255/max(lowpass(:)));
imwrite(lowpassscaled,'lowpass_scaled_lens3.TIFF');

%%
medianfiltered=zeros([4000,6000,3]);
for i=1:3
medianfiltered(:,:,i)=medfilt2(lowpassscaled(:,:,i),[6,6]);
end
    
imwrite(medianfiltered,'lowpass_mediansc_lens3.TIFF');

%%
medianfilteredh=zeros([4000,6000,3]);
for i=1:3
medianfilteredh(:,:,i)=medfilt2(hipass(:,:,i),[3,3]);
end
    
imwrite(medianfilteredh,'hipass_mediansc_lens3.TIFF');