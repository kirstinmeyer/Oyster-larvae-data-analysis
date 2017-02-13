function [n_pos,avg_horiz,avg_vert] = Average_position_KSM(lardata) 
g=length(lardata);
avg_x=zeros(1,g);
avg_z=zeros(1,g);
for j=1:length(lardata)
    [s(j),img_s(j)]=min(lardata(j).z); 
    n(j)=numel(lardata(j).z); 
    n_x(j)=n(j)-img_s(j);
end
for j=1:g
    sum_x(j)=sum(lardata(j).x(find(lardata(j).x)>img_s(j)));
    sum_z(j)=sum(lardata(j).z(find(lardata(j).z)>img_s(j)));
    if s(j)<=0.3
        avg_x(j)=sum_x(j)/n_x(j);
        avg_z(j)=sum_z(j)/n_x(j);
    else 
        avg_x(j)=-1;
        avg_z(j)=-1;
    end
end
horiz=avg_x(avg_x>=0); 
vert=avg_z(avg_z>=0);
n_pos=length(horiz);
avg_horiz=nanmean(horiz);
avg_vert=nanmean(vert);
fprintf('the number of upward tracks is %d\n',n_pos)
fprintf('the average horizontal position is %d\n',avg_horiz) 
fprintf('the average vertical position is %d\n',avg_vert) 