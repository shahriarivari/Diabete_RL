function [Q]=update_Q_learning(Q,num_state,num_next_state,num_action,reward,alpha,gamma)
Q(num_state,num_action)=Q(num_state,num_action)+alpha*(reward+...
    gamma*max(Q(num_next_state,:))-Q(num_state,num_action));
end
