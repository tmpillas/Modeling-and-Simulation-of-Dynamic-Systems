function dx = system_state_equations(t,x,m,b,k,u)
    dx(1) = x(2);
    dx(2) = -(b/m) * x(2) -(k/m) * x(1) + (1/m) * u(t);
dx = dx';
end