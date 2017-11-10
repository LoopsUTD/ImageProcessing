date = datestr(now,'yymmdd');
testtype='lcd';
filetype='.png';
%%
lens=input('Lens #: ','s');
orientation=input('Orientation (h or v):','s');
period=input('Period (2 digit pixels): ','s');
islens=input('Is there a lens (y or n)','s');
testnumber=input('4 Digit test number: ','s');
name=strcat(testtype,'-',date,'-',lens,'-',orientation,'-',period,'-',islens,'-',testnumber,filetype);

%%

img=snapshot(cam);
imwrite(img,name);