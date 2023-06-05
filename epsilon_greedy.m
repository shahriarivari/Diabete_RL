function [num_action]=epsilon_greedy(Q,num_state,epsilon)
rand=random('uniform',0,1);
[max_value,index]=max(Q(num_state,:));
if rand<1-epsilon
    num_action=index;
else
    while(1)
    num_action=randi(size(Q,2));
    if num_action~=index
        break
    end
    end
end
end