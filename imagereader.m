directory='LCDTesting1109/';
%%cd(directory);
images=dir('*.png'); 
image=zeros(24,1080,1920,3);
names=strings(24,1);
%%
datarray=strings(24,4);

%%
for i=1:24
  image(i,:,:,:)=imread(images(i).name);
  names(i,1)=images(i).name;
  variables=strsplit(names(i,1),'-');
  datarray(i,:)=variables(3:6);
  
end
%%

data=struct('lens',datarray(:,1),'orientation',datarray(:,2),...
    'period',datarray(:,3),'islens',datarray(:,4),'image',image);
%%
for i=1:24
   imshow(squeeze(image(i,:,:,:)));
end