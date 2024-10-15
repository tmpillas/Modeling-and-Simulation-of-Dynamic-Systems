function u_t = u(t, x, xd, k, lambda, r_0, r_inf, w1, w2)
    epsilon_t = epsilon(x,t,r_0,r_inf,xd,lambda);
    w_t =x(4);
    u_t = -k / w_t * epsilon_t;
end