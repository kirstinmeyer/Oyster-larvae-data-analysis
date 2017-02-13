dirlist=dir('*.mat');
results=[];
for i = [1:1:length(dirlist)]
    load(dirlist(i).name);
    [num_nonzero,num_vectors,proportion_nonzero]=Prop_tracks_off_bottom_KSM(lardata);
    tmp.name=dirlist(i).name;
    tmp.num_nonzero=num_nonzero;
    tmp.num_vectors=num_vectors;
    tmp.proportion_nonzero = proportion_nonzero;
    results=[results,tmp];
    statvector.num_nonzero(i)=num_nonzero;
    statvector.num_vectors(i)=num_vectors;
    statvector.proportion_nonzero(i)=proportion_nonzero;
end
fid=fopen('larval_off-bottom_results.csv','w');
fprintf(fid,'Proportion of larvae coming off bottom\n');
fprintf(fid,'Filename,Number of upward swimming tracks,Total number of tracks,Proportion of upward tracks\n');
for i = [1:1:length(dirlist)];
    fprintf(fid,'%s,%d,%d,%d\n',results(i).name,results(i).num_nonzero,results(i).num_vectors,results(i).proportion_nonzero);
end
fclose(fid);
