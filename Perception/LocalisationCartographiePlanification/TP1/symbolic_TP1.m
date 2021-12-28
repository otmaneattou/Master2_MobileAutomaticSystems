clc 
syms d vmax tv a ta dd da dv D 

dd = D-da-dv;
a=1; b = -2/d*vmax; c = -2/d*(vmax*tv+a/2*ta^2-dd);
delta = b^2-4*a*c; 
td  =  (b+sqrt(delta))/2;
simplify(td);

