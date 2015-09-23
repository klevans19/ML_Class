%%grad_descent_benchmark

%% Trial Function : QUAD BOWL 1-D

f= @(x) x^2;
df= @(x) 2*x;

[x_min, f_min]= grad_descent(1, .5, 10^(-6), f, df);

%% Trial Function: QUAD BOWL N-D
xi=[1,1 ,1, 1];
horzoff= [1, zeros(1,length(xi)-1)];
vertoff= [.3, zeros(1, length(xi)-1)];
f= @(x) (x+horzoff).^2+ vertoff; 
g=@(x) 2*diag(x+horzoff);    
alpha= .5*ones(size(xi));

[x_min, f_min]= grad_descent(xi,  alpha, 10^-6,  f, g)
%% Trial Function: SINE WAVE 1-D

f= @(x) sin(x); 
g=@(x) cos(x);    


xi=[1];
[x_min1, f_min1]= grad_descent(xi,  .5, 10^-6,  f, g)

xi=[1];
[x_min3, f_min3]= grad_descent(xi,  .5, 10^-1,  f, g)


xtest= linspace(-5,5); 
ftest= f(xtest); 
plot(xtest, ftest)
hold on 
plot(x_min1, f_min1, 'og', 'MarkerSize', 15)
plot(x_min3, f_min3, 'or', 'MarkerSize', 15)
legend('function', 'Tol =10^-6', 'Tol=10^-1')
axis([-2.5, -.5, -1, -.5])
title('F(x)= sin(x)')