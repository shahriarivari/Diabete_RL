function dydt=diabete1(t,y)
dydt = zeros(3,1);
global drug
% drug=0;
Gb=80;
Ib=7;
m1=0.0317;
m2=0.0123;
m3=4.92*10^-6;
m4=0.0039;
m5=79.0353;
m6=0.2659;
dydt(1) = -m1*y(1)+m2*y(3)+m1*Gb;
dydt(2) = -m2*y(2)+m3*y(3)-m3*Ib+m6*Ib;
dydt(3) = -m3*y(3)+m4*y(1)+m4*m5-m6*y(3)+m6*Ib+drug;
end