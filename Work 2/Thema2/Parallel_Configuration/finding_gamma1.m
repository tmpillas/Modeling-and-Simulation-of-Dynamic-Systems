%Find gamma1
clear
a = 2;
b = 5;
u = @(t) 5* sin(2*t);
n0 = 0.5;
f=40;
n = @(t) n0*sin(2*pi*f*t);

tspan = 0 : 0.1 : 10;

gamma1 = [2 4 6 10 15 20 25 35];
gamma2 = 5;

%i=1
i=1;
tiledlayout(8,1)
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 2$$','Interpreter','latex');
grid on

%i=2
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 4$$','Interpreter','latex');
grid on

%i=3
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 6$$','Interpreter','latex');
grid on

%i=4
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 10$$','Interpreter','latex');
grid on

%i=5
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 15$$','Interpreter','latex');
grid on

%i=6
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 20$$','Interpreter','latex');
grid on

%i=7
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 25$$','Interpreter','latex');
grid on

%i=8
i=i+1;
opts = odeset('Refine',5);
odefun = @(t,x) parallel_noise_state_equations(a,b,u,t,x,gamma1(i),gamma2,n);

[t,x] = ode45 (odefun, tspan, [0,0,0,0],opts);
X = x(:,1);
x_hat = x(:,2);
theta1_hat = x(:,3);
theta2_hat = x(:,4);

a_hat = theta1_hat;
b_hat = theta2_hat;
error = X - x_hat;
nexttile
plot(t,error)
xlabel('t','Interpreter','latex');
ylabel('error','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = x-\hat{x}$$) for $$gamma_1 = 35$$','Interpreter','latex');
grid on