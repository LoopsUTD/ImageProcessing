%clc;

%%%% Make sure to have test images in this directory [Period]px[V or H].png

screen=["lcd"];
trial=[1,2];
lens=[3,1];
isLens=["in path","out of the way"];
isLens2=['Y','N'];
period=[4,6,8,10;4,7,10,16];
orientation=['G','C'];  % Changed to capitals to match case of test image names - DM
    % Added aditional 'orientations' - G is green dots, C is RGB dots

figure;
H = gcf;

outputFile = fopen('filenames.txt','wt');
date = datestr(now,'yymmdd');

%%
for scr=1:1   % Changed to only lcd due to manual testing of kindle - DM
    dialogwait("Set screen to "+screen(scr));
   for trl=1:2
       for lns=1:2
           dialogwait("Trial "+trial(trl)+" | "+"Insert lens "+lens(lns));
           for isLns=1:2
                   dialogwait("Trial "+trial(trl)+" | "+"Make sure lens is "+isLens(isLns));
               for prd=1:4
                   for ornt=1:2
                       filename = strcat(num2str(period(ornt,prd)),'px',orientation(ornt),'.png')
                       imshow(filename,'InitialMagnification',100);    % If unusual zoom things start happening, remove the last two imshow() arguments
                       movegui(H,'center');
                       dialogwait("Trial "+trial(trl)+" | Take pic of "+"Period "+period(ornt,prd)+", Orientation: "+orientation(ornt));
                       name=strcat(screen(scr),'-',date,'-',num2str(lens(lns)),'-',orientation(ornt),'-',num2str(period(ornt,prd)),'-',isLens2(isLns),'-',num2str(trial(trl)),'.png');
                       fprintf(outputFile,strcat(name,'\n'));
                   end
               end
           end
       end
   end
end

close(H);
fclose(outputFile);

%%
function dialogwait(name)
    d = dialog('Position',[-800 300 500 150],'Name',name);

    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[20 80 210 40],...
               'String','Click the close button when you''re done.');

    btn = uicontrol('Parent',d,...
               'Position',[85 20 70 25],...
               'String','Close',...
               'Callback','delete(gcf)');
    uiwait(d);
end
