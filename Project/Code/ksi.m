function ksi_t = ksi(t,x,xd,lambda,r_0,r_inf)
r_t = r(t,lambda,r_0,r_inf);
ksi_t = (x(1) - xd(t)) /r_t;
end