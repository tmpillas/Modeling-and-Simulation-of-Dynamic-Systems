clear
a = 0.75;
b = 1.25;
k = 100;
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
odefun = @(t,x) system_state_equations(a,b,t,x,xd,k,lambda,r_0,r_inf,w1,w2,theta_m);
[t,x] = ode45 (odefun, tspan, [0,0,1,1],opts);
 a_hat = x(:,3);
 b_hat = x(:,4);

% Number of iterations (folds) for cross validation - Αριθμός folds για την εγκάρσια αξιολόγηση
    num_folds = 5;
    indices = crossvalind('Kfold', length(t), num_folds);

    errors_a = zeros(num_folds, 1);
    errors_b = zeros(num_folds, 1);

for i = 1:num_folds
        % Split training and test data -  Διαχωρισμός δεδομένων σε εκπαίδευση και δοκιμή
        test_idx = (indices == i);
        train_idx = ~test_idx;
        
        t_train = t(train_idx);
        x_train = x(train_idx, :);
        t_test = t(test_idx);
        x_test = x(test_idx, :);
        
%         % Αρχικές εκτιμήσεις - Ενδέχεται να χρειάζονται
%         a_hat(0) = 1;
%         b_hat(0) = 1;
        
    % Estimation of paremeters with training data - Εκτίμηση παραμέτρων με βάση τα δεδομένα εκπαίδευσης
    for j = 2:length(t_train)
            dt = t_train(j) - t_train(j-1);
            %u_train = u(t_train(j-1), x_train(j-1, :), xd, k, lambda, r_0, r_inf, w1, w2);
            dx_train = system_state_equations(a_hat( t_train(j-1)), b_hat( t_train(j-1)), t_train(j-1), x_train(j-1, :), xd, k, lambda, r_0, r_inf, w1, w2, theta_m);
            error = x_train(j, 1) - (x_train(j-1, 1) + dt * dx_train(1));
            
            % Update estimations - Ενημέρωση εκτιμήσεων παραμέτρων
            odefun = @(t,x) dx_train;
            [ttemp,xtemp] = ode45 (odefun, tspan, [0,0,1,1],opts);
            a_hat = xtemp(:,3);
            b_hat = xtemp(:,4);

            %a_hat = a_hat + dt * error * x_train(j-1, 1);
            %b_hat = b_hat + dt * error * u_train;
    end
        
        % Calculate errors in training data - Υπολογισμός σφαλμάτων εκτίμησης στα δεδομένα δοκιμής
        %u_test = u(t_test, x_test, xd, k, lambda, r_0, r_inf, w1, w2);
        dx_test = system_state_equations(a_hat, b_hat, t_test, x_test, xd, k, lambda, r_0, r_inf, w1, w2, theta_m);
        x1_test_hat = x_test(:, 1) + dx_test(:, 1) * (t_test(2) - t_test(1));
        
        errors_a(i) = mean(abs(a - a_hat));
        errors_b(i) = mean(abs(b - b_hat));
    end

    % Mean and standar deviation of errors - Μέση τιμή και τυπική απόκλιση των σφαλμάτων
    mean_error_a = mean(errors_a);
    std_error_a = std(errors_a);
    mean_error_b = mean(errors_b);
    std_error_b = std(errors_b);

    fprintf('Mean error in a estimation: %f (std: %f)\n', mean_error_a, std_error_a);
    fprintf('Mean error in b estimation: %f (std: %f)\n', mean_error_b, std_error_b);

    figure(1)
    subplot(2,1,1);
    plot(t, x(:,1), 'b', 'DisplayName', 'True x1');
    hold on;
    plot(t, x(:,2), 'r', 'DisplayName', 'True x2');
    xlabel('Time (s)');
    ylabel('States');
    legend;
    title('Output and estimation of output');

    subplot(2,1,2);
    plot(1:num_folds, errors_a, 'o-', 'DisplayName', 'Error in a');
    hold on;
    plot(1:num_folds, errors_b, 'x-', 'DisplayName', 'Error in b');
    xlabel('Fold');
    ylabel('Error');
    legend;
    title('Cross-Validation Errors');
