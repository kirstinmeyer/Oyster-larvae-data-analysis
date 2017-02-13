dirlist=dir('*.mat');
results=[];
for i = [1:1:length(dirlist)]
    load(dirlist(i).name);
    [n_ng,avg_track,avg_ng] = Track_length_net_gross_KSM(lardata);
    tmp.name=dirlist(i).name;
    tmp.n_ng=n_ng;
    tmp.avg_track=avg_track;
    tmp.avg_ng=avg_ng;
    results=[results,tmp];
    statvector.n_ng(i)=n_ng;
    statvector.avg_track(i)=avg_track;
    statvector.avg_ng(i)=avg_ng;
end
fid=fopen('larval_track_length_results.csv','w');
fprintf(fid,'Average track length results\n');
fprintf(fid,'Filename,number of upward tracks,average track length,average net to gross distance\n');
for i = [1:1:length(dirlist)];
    fprintf(fid,'%s,%d,%d,%d\n',results(i).name,results(i).n_ng,results(i).avg_track,results(i).avg_ng);
end
fclose(fid);