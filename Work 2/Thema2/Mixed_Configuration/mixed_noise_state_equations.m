function dx = mixed_noise_state_equations(a,b,u,t,x,gamma1,gamma2,n,theta_m)
dx(1) = -a*x(1) + b*u(t);
dx(2) = -x(3)*x(2) + x(4)*u(t)+ theta_m*(x(1)-x(2)+n(t));
dx(3) = -gamma1 * (x(1)+n(t))^2 + gamma1*x(2)*(x(1)+n(t));
dx(4) = gamma2*u(t)* (x(1)-x(2)+n(t));

dx=dx';
end 