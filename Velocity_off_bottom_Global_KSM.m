dirlist=dir('*.mat');
results=[];
for i = [1:1:length(dirlist)]
    load(dirlist(i).name);
    [rise_n,rise_avg]=Velocity_off_bottom_KSM(lardata);
    tmp.name=dirlist(i).name;
    tmp.rise_n=rise_n;
    tmp.rise_avg=rise_avg;
    results=[results,tmp];
    statvector.rise_n(i)=rise_n;
    statvector.rise_avg(i)=rise_avg;
end
fid=fopen('larval_velocity_results.csv','w');
fprintf(fid,'Average upward velocity results\n');
fprintf(fid,'Filename,number of upward tracks,average upward velocity\n');
for i = [1:1:length(dirlist)];
    fprintf(fid,'%s,%d,%d\n',results(i).name,results(i).rise_n,results(i).rise_avg);
end
fclose(fid);
