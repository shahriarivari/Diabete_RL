function [states]=build_state_list()
Glucose=0:10:700;
insulin=0:3:30;
n=1;
for i=1:numel(Glucose)
    for j=1:numel(insulin)
        states(n,1)=Glucose(i);
        states(n,2)=insulin(j);
        n=n+1;
    end
end
end