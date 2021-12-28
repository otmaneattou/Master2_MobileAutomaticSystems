function [ta,tv,td] = tempsDePhase(a,da,v,dv,d,dd)
ta = sqrt(2*da/a);
tv = (1/v)*(dv-a/2*ta^2);
td = sqrt(-2/d*(dd-v*tv-a/2*ta^2));
end 