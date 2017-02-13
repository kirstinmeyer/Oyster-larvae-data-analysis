function [n_displacement,avg_displacement] = Horiz_disp_KSM(lardata) 
for j=1:length(lardata) 
[s(j),img_s(j)]=min(lardata(j).z);
n(j)=numel(lardata(j).x);
end
for j=1:length(lardata)
    left(j)=lardata(j).x(find(lardata(j).x)==img_s(j));
    right(j)=lardata(j).x(find(lardata(j).x)==n(j));
    if s(j)<=0.3 
        horiz_disp(j)=abs(left(j)-right(j));
    else 
        horiz_disp(j)=-1; 
    end
end
h_disp=horiz_disp(horiz_disp>=0); 
sum_displacement=sum(h_disp); 
n_displacement=length(h_disp);
avg_displacement=sum_displacement/n_displacement; 
fprintf('the number of trajectories is %d\n',n_displacement) 
fprintf('the average horizontal displacement is %d\n',avg_displacement)