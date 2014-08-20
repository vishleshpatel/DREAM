function [v,s]=miad(goal)
    min_step=4;
    v=zeros(size(goal));
    s=zeros(size(goal));
    v(1)=0;
    status=0;    
    step=min_step;
    for i=2:length(goal)
         news=(v(i-1)>=goal(i-1));
         if (news==status)
             step=step*2;
         else
             step=step-min_step;
         end         
         if (news==0)
             v(i)=v(i-1)+step;
         else
             v(i)=v(i-1)-step;
         end
         v(i)=max(v(i),min_step);
         status=news;
         s(i)=step;
    end
end