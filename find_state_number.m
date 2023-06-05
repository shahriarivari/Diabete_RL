function [num_state]=find_state_number(states,G,I)
state=[G I];
difference=states-state;
[value,index]=min(abs(difference));
num_state=sum(index)-1;
end
    