clc;
clear all;

A=[4 1 -1 1;
   1 4 -1 -1;
  -1 -1 5 1;
   1 -1 1 3;];
B=[-2; -1; 0; 1;];
x0=[0;0;0;0;];
tol=10^-3;
k=0;
max=100;
n=4;
w=1.3;
while k<=max
    for i=1:n
        sum1=0;
        sum2=0;
        for j=1:i-1
            sum1=sum1+A(i,j)*x(j);
        end
        for j=i+1:n
            sum2=sum2+A(i,j)*x0(j);
        end
        x(i)=w*((B(i)-sum1-sum2)/A(i,i))+(1-w)*x0(i);
    end
    if norm(x-x0)<tol
        x
        break
    end
    x0=x;
    k=k+1;
end

k
inv(A)*B
