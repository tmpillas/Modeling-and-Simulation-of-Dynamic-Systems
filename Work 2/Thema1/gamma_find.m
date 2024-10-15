% Choosing step gamma
clear
a = 4;
b = 1.5;
u1 = @(t) 5 +0*t;
u2 = @(t) 5* sin(2*t);
u=u2;
lambda = 5;
tspan = 0 : 0.1 : 10;

gamma = [1 5 10 15 20 25 30];

%i=1
i=1;
tiledlayout(7,1)

opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 1','Interpreter','latex');
grid on

%i=2
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 5','Interpreter','latex');
grid on

%i=3
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 10','Interpreter','latex');
grid on

%i=4
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 15','Interpreter','latex');
grid on

%i=5
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 20','Interpreter','latex');
grid on

%i=6
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 25','Interpreter','latex');
grid on

%i=7
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) system_state_equations(a,b,u,lambda,gamma(i),t,x);

[t,x] = ode45 (odefun,tspan, [0,0,0,0,0,0],opts);
X = x(:,1);
theta1_hat = x(:,2);
theta2_hat = x(:,3);
phi1= x(:,4);
phi2 = x(:,5);
x_hat = x(:,6);
error = X - x_hat;

nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for gamma = 30','Interpreter','latex');
grid on