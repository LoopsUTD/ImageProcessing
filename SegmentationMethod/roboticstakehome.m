%Calvin and Keene Robotics Takehome

%% Open the color images and convert to grayscale
clear all
cpens=imread('regulararray.png'); %read in a file, convert to matlab matrices
gpens=rgb2gray(cpens); %converts from color to grayscale
imshow(cpens) %displays the image in a window
figure
imshow(gpens)
%% Do some filtering
G = fspecial('gaussian',[10 10],2); %create 10x10 gaussian blur kernel
blurpens= imfilter(gpens,G,'same'); %filters image with gaussian blur(best to use before threhsolding
imshow(blurpens)
%% Threshold the image
threshpens = calvthresh(blurpens,200);
%display the thresholded image
figure
imshow(threshpens)
%% Morphological filtering
se = strel('square',6); %creates a 8x8 kernel for morph. filtering
erodedpens = imerode(threshpens,se); %erodes image (best to use afterthresholding)
dilatedpens = imdilate(erodedpens,se); %dilates image (best to use afterthresholding)
%displays the image. imscale(dilatedpens) will beuseful if you have images with pixel values outside the standard range, suchas very large numbers after your semgmentation labeling.
medpens= medfilt2(dilatedpens, [10 10]); %median filters image (best to use afterthresholding
imshow(medpens)
%imsave %saves the current image
%% Segmentation
%assign a unique value to each white pixel in the image
seg1 = calvseg(medpens);
%% should appear as gradiated thresholded image as pixel label value increases
figure
imagesc(seg1)
%segment the image, each segment has a unique value
seg2 = segim2(seg1);
%% show the segments in grayscale
figure
imagesc(seg2)
%relabel the segments so they have a logical order that is sequential
seg3=relabel(seg2);
%% display the final segmented image
figure
imagesc(seg3)
%%
%calculate the segment parameters
segpars=getallseginfo(seg3);
%put them in column form for putting in a table
blob=segpars(:,1);
area = segpars(:,2);
cx = segpars(:,3);
cy = segpars(:,4);
orientation = segpars(:,5);
table(blob,area,cx,cy,orientation)