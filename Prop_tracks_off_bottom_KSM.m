function [num_nonzero,num_vectors,proportion_nonzero] = Prop_tracks_off_bottom_KSM(lardata) %%define the function
num_vectors=0; %%starting value
num_nonzero=0; %%starting value
for j=1:length(lardata) %%for every track in the lardata file
[s(j),img_s(j)]=min(lardata(j).z); %%s is defined as the minimum z-displacement, and img_s is its location in the array
    if s(j)<=0.3 %%if the larva is on bottom (I used 0.3 because that's the approximate size of a larva)
        num_vectors=num_vectors+1; %%count that larva as being on bottom
    end
    if (s(j)<=0.3) && (max(lardata(j).wf)>0) %%if the larva is on bottom AND it there is one positive z-velocity in the track
       num_nonzero=num_nonzero+1; %%count that as a larva that came up off bottom
    end
end
proportion_nonzero=num_nonzero/num_vectors; %%calculate the proportion of tracks where the larva came off bottom 
fprintf('the number of non-zero is %d\n',num_nonzero) %%report the number of tracks where the larva came off bottom
fprintf('the total number of vectors is %d\n',num_vectors) %%report the number of tracks where a larva was on bottom
fprintf('the proportion of nonzero vectors is %d\n',proportion_nonzero) %%report the proportion
