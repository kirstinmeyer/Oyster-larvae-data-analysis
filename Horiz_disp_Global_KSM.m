dirlist=dir('*.mat'); 
results=[]; 
for i = [1:1:length(dirlist)] 
    load(dirlist(i).name); 
    [n_displacement,avg_displacement]=Horiz_disp_KSM(lardata); 
    tmp.name=dirlist(i).name; 
    tmp.n_displacement=n_displacement;
    tmp.avg_displacement=avg_displacement;
    results=[results,tmp];
    statvector.n_displacement(i)=n_displacement;
    statvector.avg_displacement(i)=avg_displacement;
end
fid=fopen('larval_horiz_displacement_results.csv','w'); 
fprintf(fid,'Average horizontal displacement results\n'); 
fprintf(fid,'Filename,number of tracks,average horizontal displacement\n'); 
for i = [1:1:length(dirlist)]; 
    fprintf(fid,'%s,%d,%d\n',results(i).name,results(i).n_displacement,results(i).avg_displacement); 
end
fclose(fid); 
