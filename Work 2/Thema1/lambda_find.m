% Choosing pole lambda
clear
a = 4;
b = 1.5;
u1 = @(t) 5 +0*t;
u2 = @(t) 5* sin(2*t);
u =u2;
gamma = 25;
tspan = 0 : 0.1 : 8;

lambda = [1 2 3 4 5 6];

%i=1
i=1;
tiledlayout(6,1)

opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda(i),gamma,t,x);

[t,x] = ode45 (odefun, tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda(i) - theta1_hat;
b_hat = theta2_hat;

nexttile
hold on
plot(t,a_hat)
plot(t,4+0*t)
plot(t,b_hat)
plot(t,1.5+0*t)
hold off
xlabel('t','Interpreter','latex')
ylabel('$$(\hat{a})$$,a,$$(\hat{b})$$,b','Interpreter','latex');
title('Estimated parameters for lambda = 1 and their true values','Interpreter','latex')
legend ({'$$(\hat{a})$$','a','$$(\hat{b})$$','b'},'Interpreter','latex')
grid on

%i=2
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda(i),gamma,t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda(i) - theta1_hat;
b_hat = theta2_hat;

nexttile
hold on
plot(t,a_hat)
plot(t,4+0*t)
plot(t,b_hat)
plot(t,1.5+0*t)
hold off
xlabel('t','Interpreter','latex')
ylabel('$$(\hat{a})$$,a,$$(\hat{b})$$,b','Interpreter','latex');
title('Estimated parameters for lambda = 2 and their true values','Interpreter','latex')
legend ({'$$(\hat{a})$$','a','$$(\hat{b})$$','b'},'Interpreter','latex')
grid on

%i=3
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda(i),gamma,t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda(i) - theta1_hat;
b_hat = theta2_hat;

nexttile
hold on
plot(t,a_hat)
plot(t,4+0*t)
plot(t,b_hat)
plot(t,1.5+0*t)
hold off
xlabel('t','Interpreter','latex')
ylabel('$$(\hat{a})$$,a,$$(\hat{b})$$,b','Interpreter','latex');
title('Estimated parameters for lambda = 3 and their true values','Interpreter','latex')
legend ({'$$(\hat{a})$$','a','$$(\hat{b})$$','b'},'Interpreter','latex')
grid on

%i=4
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda(i),gamma,t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda(i) - theta1_hat;
b_hat = theta2_hat;

nexttile
hold on
plot(t,a_hat)
plot(t,4+0*t)
plot(t,b_hat)
plot(t,1.5+0*t)
hold off
xlabel('t','Interpreter','latex')
ylabel('$$(\hat{a})$$,a,$$(\hat{b})$$,b','Interpreter','latex');
title('Estimated parameters for lambda = 4 and their true values','Interpreter','latex')
legend ({'$$(\hat{a})$$','a','$$(\hat{b})$$','b'},'Interpreter','latex')
grid on

%i=5
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda(i),gamma,t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda(i) - theta1_hat;
b_hat = theta2_hat;

nexttile
hold on
plot(t,a_hat)
plot(t,4+0*t)
plot(t,b_hat)
plot(t,1.5+0*t)
hold off
xlabel('t','Interpreter','latex')
ylabel('$$(\hat{a})$$,a,$$(\hat{b})$$,b','Interpreter','latex');
title('Estimated parameters for lambda = 5 and their true values','Interpreter','latex')
legend ({'$$(\hat{a})$$','a','$$(\hat{b})$$','b'},'Interpreter','latex')
grid on

%i=6
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda(i),gamma,t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;
a_hat = lambda(i) - theta1_hat;
b_hat = theta2_hat;

nexttile
hold on
plot(t,a_hat)
plot(t,4+0*t)
plot(t,b_hat)
plot(t,1.5+0*t)
hold off
xlabel('t','Interpreter','latex')
ylabel('$$(\hat{a})$$,a,$$(\hat{b})$$,b','Interpreter','latex');
title('Estimated parameters for lambda = 6 and their true values','Interpreter','latex')
legend ({'$$(\hat{a})$$','a','$$(\hat{b})$$','b'},'Interpreter','latex')
grid on