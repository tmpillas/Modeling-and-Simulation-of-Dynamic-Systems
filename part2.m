% Part 2 - Circuit R-L-C
clear;

t = 0 : 0.1 : 10;
u_1 = @(t) 3 * sin(pi*t);
du_1 = @(t) 3*pi*cos(pi*t);
ddu_1 = @(t) -3*pi^2*sin(pi*t);
u_2 = 2.5;
[V_R,V_C] = v(t);

%LEAST SQUARES METHOD (EKTIMHSH PARAMETRWN)
lamda_1 = 10; 
lamda_2 = 10;
LamdaFilter = [1, lamda_1 + lamda_2, lamda_1 * lamda_2];

phi_1 = tf([-1 0], LamdaFilter);
phi_2 = tf(-1, LamdaFilter);
phi_3 = tf([1,0], LamdaFilter);
phi_4= tf(1, LamdaFilter);
phi_5 = tf([1,0], LamdaFilter);
phi_6= tf(1, LamdaFilter);
Phi(:,1) = lsim(phi_1,V_C,t);
Phi(:,2) = lsim(phi_2,V_C,t);
Phi(:,3) = lsim(phi_3,u_1(t),t);
Phi(:,4) = lsim(phi_4,u_1(t),t);
Phi(:,5) = lsim(phi_5,u_2 * ones(1,length(t)),t);
Phi(:,6) = lsim(phi_6,u_2 * ones(1,length(t)),t);

theta = V_C * Phi / (Phi'*Phi);
disp('Estimated theta matrix: ')
disp(theta)

RC_inverted = (theta(1) +(lamda_1 +lamda_2) + theta(3) + theta(5))/3;
LC_inverted = (theta(2) + lamda_1*lamda_2 + theta(6))/2;

X = sprintf('The estimations using the Least Squares Method for lamda_1 = %d and lamda_2 = %d are:', lamda_1, lamda_2);
disp(X)
disp('1/RC =')
disp(RC_inverted)
disp('1/LC =')
disp(LC_inverted)


figure(1)
plot (t,V_C)
xlabel('t','Interpreter','latex');
ylabel('$$V_C$$','Interpreter','latex');
title ('Voltage $$V_C$$ in time','Interpreter','latex');
grid on

V_C_hat = Phi* theta'; 

figure(2)
plot (t,V_C_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{V_C}$$','Interpreter','latex');
title ('Voltage $$\hat{V_C} $$ in time', 'Interpreter','latex');
grid on

C = [V_C' V_C_hat];
figure (3)
plot (t,C)
xlabel('t','Interpreter','latex');
ylabel('Voltage','Interpreter','latex');
title ('Common','Interpreter','latex');
legend('$$V_C$$','$$\hat{V_C}$$','Interpreter','latex')
grid on

e = V_C' - V_C_hat;
figure(4)
plot(t,e)
xlabel('t','Interpreter','latex');
ylabel('e','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = V_C-\hat{V_C}$$)','Interpreter','latex');
grid on


figure(5)
plot (t,V_R)
xlabel('t','Interpreter','latex');
ylabel('$$V_R$$','Interpreter','latex');
title ('Voltage $$V_R$$ in time','Interpreter','latex');
grid on

V_R_hat = u_2 - V_C_hat +u_1(t');

figure(6)
plot (t,V_R_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{V_R}$$','Interpreter','latex');
title ('Voltage $$\hat{V_R} $$ in time', 'Interpreter','latex');
grid on

C = [V_R' V_R_hat];
figure (7)
plot (t,C)
xlabel('t','Interpreter','latex');
ylabel('Voltage','Interpreter','latex');
title ('Common','Interpreter','latex');
legend('$$V_R$$','$$\hat{V_R}$$','Interpreter','latex')
grid on

e = V_R' - V_R_hat;
figure(8)
plot(t,e)
xlabel('t','Interpreter','latex');
ylabel('e','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = V_R-\hat{V_R}$$)','Interpreter','latex');
grid on

%Erothma 2

V_C(1,10) = 17* V_C(1,10);
V_C(1,20) = 7* V_C(1,20);
V_C(1,25) = 15* V_C(1,25);
V_C(1,50) = 22* V_C(1,25);
V_C(1,77) = 19* V_C(1,77);
V_C(1,90) = 10* V_C(1,90);


figure(9)
plot (t,V_C)
xlabel('t','Interpreter','latex');
ylabel('$$V_C$$','Interpreter','latex');
title ('Voltage $$V_C$$ in time','Interpreter','latex');
grid on

phi_1 = tf([-1 0], LamdaFilter);
phi_2 = tf(-1, LamdaFilter);
phi_3 = tf([1,0], LamdaFilter);
phi_4= tf(1, LamdaFilter);
phi_5 = tf([1,0], LamdaFilter);
phi_6= tf(1, LamdaFilter);
Phi(:,1) = lsim(phi_1,V_C,t);
Phi(:,2) = lsim(phi_2,V_C,t);
Phi(:,3) = lsim(phi_3,u_1(t),t);
Phi(:,4) = lsim(phi_4,u_1(t),t);
Phi(:,5) = lsim(phi_5,u_2 * ones(1,length(t)),t);
Phi(:,6) = lsim(phi_6,u_2 * ones(1,length(t)),t);

theta = V_C * Phi / (Phi'*Phi);
disp('Estimated theta matrix with noise present: ')
disp(theta)

RC_inverted = (theta(1) +(lamda_1 +lamda_2) + theta(3) + theta(5))/3;
LC_inverted = (theta(2) + lamda_1*lamda_2 + theta(6))/2;

X = sprintf('The estimations with noise present using the Least Squares Method for lamda_1 = %d and lamda_2 = %d are:', lamda_1, lamda_2);
disp(X)
disp('1/RC =')
disp(RC_inverted)
disp('1/LC =')
disp(LC_inverted)

V_C_hat = Phi* theta'; 
figure(10)
plot (t,V_C_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{V_C}$$','Interpreter','latex');
title ('Voltage $$\hat{V_C} $$ in time', 'Interpreter','latex');
grid on
C = [V_C' V_C_hat];
figure (11)
plot (t,C)
xlabel('t','Interpreter','latex');
ylabel('Voltage','Interpreter','latex');
title ('Common','Interpreter','latex');
legend('$$V_C$$','$$\hat{V_C}$$','Interpreter','latex')
grid on

e = V_C' - V_C_hat;
figure(12)
plot(t,e)
xlabel('t','Interpreter','latex');
ylabel('e','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = V_C-\hat{V_C}$$)','Interpreter','latex');
grid on


figure(13)
plot (t,V_R)
xlabel('t','Interpreter','latex');
ylabel('$$V_R$$','Interpreter','latex');
title ('Voltage $$V_R$$ in time','Interpreter','latex');
grid on

V_R_hat = u_2 - V_C_hat +u_1(t');

figure(14)
plot (t,V_R_hat)
xlabel('t','Interpreter','latex');
ylabel('$$\hat{V_R}$$','Interpreter','latex');
title ('Voltage $$\hat{V_R} $$ in time', 'Interpreter','latex');
grid on

C = [V_R' V_R_hat];
figure (15)
plot (t,C)
xlabel('t','Interpreter','latex');
ylabel('Voltage','Interpreter','latex');
title ('Common','Interpreter','latex');
legend('$$V_R$$','$$\hat{V_R}$$','Interpreter','latex')
grid on

e = V_R' - V_R_hat;
figure(16)
plot(t,e)
xlabel('t','Interpreter','latex');
ylabel('e','Interpreter','latex');
title ('Error of model using estimated parameters ($$e = V_R-\hat{V_R}$$)','Interpreter','latex');
grid on

