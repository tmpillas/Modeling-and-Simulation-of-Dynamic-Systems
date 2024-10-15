function r_t = r(t,lambda,r_0,r_inf)
r_t = (r_0 - r_inf)* exp(-lambda*t) + r_inf;
end