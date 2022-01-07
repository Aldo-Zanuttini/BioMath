clear all
for i=1:1000
    Lacker1;
    ovulation_number(i)=length(find(x_sol(end,:)>1));
    ovulation_time(i)=ceil(100*t(end))/100;
end
x2=sort(unique(ovulation_time));
for i=1:length(x2)
    x(i)=length(find(ovulation_time==x2(i)));
end
x2=x2-mean(x2);
for i=1:10
    y(i)=length(find(ovulation_number==i))/1000;
end
figure(1)
bar(x2,x)
xlabel('mean ovulation time')
ylabel('frequency (%)')

figure(2)
bar(y)
xlabel('ovulation number')
ylabel('frequency (%)')
