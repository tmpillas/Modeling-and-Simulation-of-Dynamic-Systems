function dx = system_state_equations(a,b,t,x,xd,k,lambda,r_0,r_inf,w1,w2,theta_m)
u_t = u(t, x, xd, k, lambda, r_0, r_inf, w1, w2);
dx(1) = a*x(1)+b*u_t;
dx(2) = x(3)*x(1)+x(4)*u_t+theta_m*(x(1)-x(2));
if(x(3)>0) || ((x(3)==0)&&(dx(3)>0))
%if(x(3)>0)
      dx(3) = x(1)*(x(1)-x(2));
 else 
     dx(3) = 0;
 end
  if ((x(4)>w1) &&(x(4)<w2)) ||((x(4)==w1)&&((x(1) - x(2)) * u_t > 0)) ||((x(4)==w2)&&((x(1) - x(2)) * u_t<0))
      dx(4) = (x(1)-x(2))*u_t;
 else
     dx(4) =0;
 end
 dx=dx';
end
