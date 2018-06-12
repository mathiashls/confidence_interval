means = csvread('end2end_delay_mean-1.csv', 1, 0);
n=15; % Sample size
pm=12;  ps=10;  % mean(pm) and standard deviation(ps)
alpha=0.05; % trust level (alpha)
num_exp=100;
figure;  hold on;
counter=0;
for i=1:num_exp;
    x=pm+ps*randn(n,1);
    mx=mean(x);
    zcr=norminv(1-alpha/2,0,1);
    sem=ps/sqrt(n);
    me=zcr*sem;
    CI1= mx-me;
    CI2= mx+me;
    plot(i*ones(1,n), x, 'k.','markersize',5);
    plot(i*ones(1,2),[CI1, CI2],'g+')
    if pm<CI1 || pm>CI2
        plot(i,pm,'r*','markersize',10)
        counter=counter+1;
    end
end
xlabel('numero do experimento')
ylabel('observacoes ')
title(['95% CI:',num2str(mx,3),'\pm',num2str(me,3)]), shg
counter_mean = 1 - counter/num_exp