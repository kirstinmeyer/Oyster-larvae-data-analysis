function [n_ng,avg_track,avg_ng] = Track_length_net_gross_KSM(lardata) %define the function
g=length(lardata); %need this variable for the next step
up_track=zeros(1,g); %setting up a matrix of the correct size that I'll fill later
disp=zeros(1,g); %same
for j=1:g %for every larval track in the lardata file
    [s(j),img_s(j)]=min(lardata(j).z);  %find the minimum z-displacement and its position in the array
    n(j)=numel(lardata(j).z); %find how many z-displacements there are 
    h=img_s(j)+1:1:n(j);    %for each value of z that occurs AFTER the minimum z-displacement
    dist_n(h,j)=sqrt((lardata(j).z(h)-lardata(j).z(h-1)).^2+(lardata(j).x(h)-lardata(j).x(h-1)).^2); %use the Pythagorean theorem to find the distance the larval travels between frames 
    dist(1,j)=sum(dist_n(:,j)); %add all those distances to get the total distance the larva traveled
    displacement(j)=sqrt((lardata(j).z(n(j))-lardata(j).z(img_s(j))).^2+(lardata(j).x(n(j))-lardata(j).x(img_s(j))).^2); %use the Pythagorean theorem to find the net distance the larva traveled
    if s(j)<=0.3 %if the larva was on bottom
        up_track(1,j)=dist(j); %then keep the value for the total distance traveled
        disp(j)=displacement(j); %and keep the value for its net distance traveled
    else %if the larva wasn't on bottom
        up_track(1,j)=-1; %just use a dummy number instead of the calculated distances 
        disp(j)=-1;
    end
end
gross=up_track(up_track>=0);   %discard all dummy numbers, keeping only distances calculated for tracks where the larva was on bottom
net=disp(disp>=0);
for k=1:length(gross)   %for each track where the larva was on bottom
    net_gross(k)=net(k)/gross(k); %find the ratio of the net to total distance traveled
end
avg_track=nanmean(net); %find the average total distance traveled
n_ng=length(net_gross); %count the number of tracks
avg_ng=nanmean(net_gross); %find the average ratio of net to total distance traveled
fprintf('the number of tracks is %d\n',n_ng) %report number of tracks
fprintf('the average track length is %d\n',avg_track) %report average track length
fprintf('the average net over gross distance traveled is %d\n',avg_ng) %report average ratio 