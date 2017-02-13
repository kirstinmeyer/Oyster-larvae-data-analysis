function [rise_n,rise_avg] = Velocity_off_bottom_KSM(lardata) %%define the function
g=length(lardata); %%define i because it's needed in the next step
up=zeros(1,g); %%set up a matrix of zeros that I can fill later
for j=1:length(lardata) %%for every larval track in the lardata file
    [s(j),img_s(j)]=min(lardata(j).z); %%s is the minimum z-displacement, img_s is its location in the array
    if s(j)<=0.3 %%if the larva was on bottom
        up(1,j)=nanmean(lardata(j).wf>0); %%then calculate the mean of all velocities in that track that are >0
    else %%if the larva wasn't on bottom
        up(1,j)=-1; %%insert a dummy number
    end
end
rise=up(up>0); %%remove dummy numbers to get a matrix with only upward swimming velocities
rise_n=length(rise); %%count how many velocities are in that matrix
rise_avg=sum(rise)/rise_n; %%calculate the average upward velocity
fprintf('the number of upward tracks is %d\n',rise_n) %%report the number of upward-swimming tracks
fprintf('the average upward velocity is %d\n',rise_avg) %%report the average upward velocity