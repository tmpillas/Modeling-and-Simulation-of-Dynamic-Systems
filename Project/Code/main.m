clear
a = 0.75;
b = 1.25;
k = 20;
lambda = 1;
r_inf = 0.05;
r_0 = 20;
w1= 0.5;
w2 = 1.5;
A = 5;
theta_m=4;

tspan = 0 : 0.01 : 10;
xd = @(t) A*cos(t);


opts = odeset('Refine',5);
%odefun = @(t,x) a*x+b*(1+0*.t);
%odefun = @(t,x) a*x+b*u(t, x, xd, k, lambda, r_0, r_inf, w1, w2);
%u_t = u(tspan, x, xd, k, lambda, r_0, r_inf, w1, w2);
odefun = @(t,x) system_state_equations(a,b,t,x,xd,k,lambda,r_0,r_inf,w1,w2,theta_m);
[t,x] = ode45 (odefun, tspan, [0,0,1,1],opts);

X = x(:,1);
X_hat = x(:,2);
a_hat = x(:,3);
b_hat = x(:,4);
figure(1)
plot(t,X)
xlabel('t','Interpreter','latex');
ylabel('x','Interpreter','latex');
title ('System output (x)','Interpreter','latex');
grid on

figure(2)
plot(t,X_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{x}$$','Interpreter','latex');
title ('System output estimation $$(\hat{x})$$','Interpreter','latex');
grid on

figure(3)
plot(t,a_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{a}$$','Interpreter','latex');
title ('Estimation of parameter a $$(\hat{a})$$','Interpreter','latex');
grid on

figure(4)
plot(t,b_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{b}$$','Interpreter','latex');
title ('Estimation of parameter b $$(\hat{b})$$','Interpreter','latex');
grid on
