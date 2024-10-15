function dx = system_state_equations(a,b,u,lambda,gamma,t,x)
dx(1) = -a*x(1) + b* u(t);
dx(2) = gamma*x(4) * (x(1) - x(6));
dx(3) = gamma*x(5) * (x(1) - x(6));
dx(4) = -lambda*x(4) + x(1);
dx(5) = -lambda*x(5) + u(t);
dx(6) = (x(2)-lambda)*x(6) + x(3)*u(t);

dx = dx';
end