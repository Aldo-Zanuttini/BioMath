N=10;
M1=3.85;
M2=15.15;
x0=0.1*rand(N,1)';
t0=0;
tend=10;
Option=odeset('Events',@myEvent);
[t,x_sol]=ode45(@lacker_sys,[t0,tend],x0,Option);
figure(1)
for i=1:N
    plot(t,x_sol(:,i))
    hold on
end
xlabel('time')
ylabel('maturity')
axis([0,1.3,0,1.5])
function [value, isterminal, direction] = myEvent(t,x)
value=min(x)-10^(-6);
isterminal=1;
direction=0;
end
function LS=lacker_sys(t,x)
N=10;
M1=3.85;
M2=15.15;
X=sum(x);
for i=1:N
    LS(i)=x(i)*(1-(X-x(i)*M1)*(X-x(i)*M2));
end
LS=LS';
end