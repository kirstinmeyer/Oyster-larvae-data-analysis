function [n_displacement,avg_displacement] = Displacement_mean_KSM(lardata) %%define the function
for j=1:length(lardata) %%for every track in the lardata file
[s(j),img_s(j)]=min(lardata(j).z); %%s is the minimum z-displacement, and img_s is its location in the array
[f(j),img_f(j)]=max(lardata(j).z); %%similarly, f is the maximum z-displacement, and img_f is its location
    if s(j)<=0.3 && img_f(j)>img_s(j) %%if the larva was on bottom and then swam up (not swimming down to bottom)
        displacement(j)=f(j)-s(j); %%calculate the upward distance traveled
    else %%if the larva wasn't on bottom
        displacement(j)=-1; %%use a dummy number
    end
end
disp=displacement(displacement>=0); %%filter out the dummy numbers to get a matrix of only upward displacements
sum_displacement=sum(disp); %%add the displacements
n_displacement=length(disp); %%count the displacements
avg_displacement=sum_displacement/n_displacement; %%find the average upward displacement
fprintf('the number of upward trajectories is %d\n',n_displacement) %%report the number of displacements
fprintf('the average net upward displacement is %d\n',avg_displacement) %%report the average displacement