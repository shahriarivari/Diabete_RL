clear all
close all
clc
global drug
epsilon=0.5;
alpha=0.1;
gamma=0.5;
actions=build_action_list();
states=build_state_list();
Q=zeros(size(states,1),size(actions,2));
G=250; %initial value
X=25;  %initial value
I=10;  %initial value
glucose=G;
X_value=X;
insulin=I;
for i=1:10000
    if i==1500
        G=G+300;
    elseif i==4500
        G=G-50;
    elseif i==8000
        G=G+200;
    end
    [num_state]=find_state_number(states,G,I);
    [num_action]=epsilon_greedy(Q,num_state,epsilon);
    drug=actions(1,num_action);
    tspan = [0 30];
    y0 = [G X I];
    [t,y] = ode45(@diabete1, tspan, y0);
    G_next=y(end,1);
    X_next=y(end,2);
    I_next=y(end,3);
    [num_next_state]=find_state_number(states,G_next,I_next);
    reward=-abs(G_next-90);
    [Q]=update_Q_learning(Q,num_state,num_next_state,num_action,reward,alpha,gamma);
    G=G_next;
    X=X_next;
    I=I_next;
    glucose=[glucose G];
    X_value=[X_value X];
    insulin=[insulin I];
    epsilon=epsilon*0.999;
end
figure(1)
plot(glucose)
title('Glucose Concentration')
figure(2)
plot(X_value)
title('Insulin icomparatment(X)')
figure(3)
plot(insulin)
title('Insulin Concentration')
