% Erothma 2 - Lyapunov Method Parallel Configuration
clear
a = 2;
b = 5;
u = @(t) 5* sin(2*t);
n0 = 0.5;
f=4;
n = @(t) n0*sin(2*pi*f*t);

tspan = 0 : 0.01 : 10;

gamma1 = 4;
gamma2 = 2;


opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1,gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;

figure(1)
plot (t,X)
xlabel('t','Interpreter','latex');
ylabel('x','Interpreter','latex');
title ('System output (x)','Interpreter','latex');
grid on

figure(2)
plot(t,x_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{x}$$','Interpreter','latex');
title ('Estimation of system output $$(\hat{x})$$','Interpreter','latex');
grid on

C = [X x_hat];
figure (3)
plot (t,C)
xlabel('t','Interpreter','latex');
ylabel('output','Interpreter','latex');
title ('Common','Interpreter','latex');
legend('$$x$$','$$\hat{x}$$','Interpreter','latex');
grid on


figure(4)
plot(t,a_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{a}$$','Interpreter','latex');
title ('Estimation of a $$(\hat{a})$$','Interpreter','latex');
grid on

figure(5)
plot(t,b_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{b}$$','Interpreter','latex');
title ('Estimation of b $$(\hat{b})$$','Interpreter','latex');
grid on

figure(6)
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$)','Interpreter','latex');
grid on
