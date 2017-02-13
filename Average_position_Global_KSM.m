dirlist=dir('*.mat');
results=[];
for i = [1:1:length(dirlist)]
    load(dirlist(i).name);
    [n_pos,avg_horiz,avg_vert] = Average_position_KSM(lardata);
    tmp.name=dirlist(i).name;
    tmp.n_pos=n_pos;
    tmp.avg_horiz=avg_horiz;
    tmp.avg_vert=avg_vert;
    results=[results,tmp];
    statvector.n_pos(i)=n_pos;
    statvector.avg_horiz(i)=avg_horiz;
    statvector.avg_vert(i)=avg_vert;
end
fid=fopen('larval_position_results.csv','w');
fprintf(fid,'Average larval position results\n');
fprintf(fid,'Filename,number of upward tracks,average horizontal position,average vertical position\n');
for i = [1:1:length(dirlist)];
    fprintf(fid,'%s,%d,%d,%d\n',results(i).name,results(i).n_pos,results(i).avg_horiz,results(i).avg_vert);
end
fclose(fid);