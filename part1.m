% Part 1 - System mass-spring-damper
clear
m = 8.5;
b = 0.65;
k = 2;
u = @(t) 10 * cos(0.5*pi*t) + 3;

tspan = 0 : 0.1 : 10;

opts = odeset('Refine',5);
odefun = @(t,y) system_state_equations(t,y,m,b,k,u);

[t,y] = ode45 (odefun, tspan, [0,0]);
Y = y(:,1);
figure(1)
plot (t,Y)
xlabel('t','Interpreter','latex');
ylabel('y','Interpreter','latex');
title ('System output (y)','Interpreter','latex');
grid on

%LEAST SQUARES METHOD (EKTIMHSH PARAMETRWN)
lamda_1 = 1; 
lamda_2 = 1;
LamdaFilter = [1, lamda_1 + lamda_2, lamda_1 * lamda_2];

phi_1 = tf([-1 0], LamdaFilter);
phi_2 = tf(-1, LamdaFilter);
phi_3 = tf(1, LamdaFilter);
Phi(:,1) = lsim(phi_1,Y,t);
Phi(:,2) = lsim(phi_2,Y,t);
Phi(:,3) = lsim(phi_3,u(t),t);

theta = Y' * Phi / (Phi'*Phi);
disp('Estimated theta matrix: ')
disp(theta)

m_hat = 1/ theta(3);
b_hat = m_hat*theta(1) +m_hat * (lamda_1+lamda_2);
k_hat = m_hat * (theta(2) + lamda_2*lamda_1);

X = sprintf('The estimations using the Least Squares Method for lamda_1 = %d and lamda_2 = %d are:', lamda_1, lamda_2);
disp(X)
disp('k_hat =')
disp(k_hat)
disp('b_hat =')
disp(b_hat)
disp('m_hat =')
disp(m_hat)

% Output using estimations

odefun = @(t,y) system_state_equations(t,y,m_hat,b_hat,k_hat,u);

[t,y] = ode45 (odefun, tspan, [0,0]);
Y_hat = y(:,1);
figure(2)
plot (t,Y_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{y}$$','Interpreter','latex');
title ('System output using estimations $$(\hat{y})$$','Interpreter','latex');
grid on

C = [Y Y_hat];
figure (3)
plot (t,C)
xlabel('t','Interpreter','latex');
ylabel('output','Interpreter','latex');
title ('Common','Interpreter','latex');
legend('$$y$$','$$\hat{y}$$','Interpreter','latex');
grid on

e = Y - Y_hat;
figure(4)
plot(t,e)
xlabel('t','Interpreter','latex');
ylabel('e','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = y-\hat{y}$$)','Interpreter','latex');
grid on
