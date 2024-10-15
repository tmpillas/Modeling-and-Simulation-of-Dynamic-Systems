% Erothma 1
clear
a = 4;
b = 1.5;
u1 = @(t) 5 +0*t;
u2 = @(t) 5* sin(2*t);
u= u2;
gamma = 25;
lambda = 4;

tspan = 0 : 0.1 : 10;

opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma,t,x);

[t,x] = ode45 (odefun, tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda - theta1_hat;
b_hat = theta2_hat;

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
