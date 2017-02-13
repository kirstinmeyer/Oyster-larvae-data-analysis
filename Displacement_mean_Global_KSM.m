dirlist=dir('*.mat'); %%tell Matlab to look at every .mat file in the folder
results=[]; %%create an empty results matrix that will get filled later
for i = [1:1:length(dirlist)] %for each file in the directory
    load(dirlist(i).name); %load its name
    [n_displacement,avg_displacement]=Displacement_mean_KSM(lardata); %find the function
    tmp.name=dirlist(i).name; %I don't get any of this section
    tmp.n_displacement=n_displacement;
    tmp.avg_displacement=avg_displacement;
    results=[results,tmp];
    statvector.n_displacement(i)=n_displacement;
    statvector.avg_displacement(i)=avg_displacement;
end
fid=fopen('larval_displacement_results.csv','w'); %Create a new .csv file to record the results in
fprintf(fid,'Average upward displacement results\n'); %Add a title in the first line of the CSV
fprintf(fid,'Filename,number of upward tracks,average upward displacement\n'); %Row titles for the CSV
for i = [1:1:length(dirlist)]; %for each lardata file in the directory
    fprintf(fid,'%s,%d,%d\n',results(i).name,results(i).n_displacement,results(i).avg_displacement); %fill in the cells with these variables
end
fclose(fid); %close the file
