function epsilon_t = epsilon(x,t,r_0,r_inf,xd,lambda)
ksi_t = ksi(t,x,xd,lambda,r_0,r_inf);
epsilon_t = log((1+ksi_t)/ (1-ksi_t));
end