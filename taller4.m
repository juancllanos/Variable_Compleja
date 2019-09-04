% r = 1;
% xo = 0;
% yo = 0;
% zo = 0;
% m =20;
% n = 10;
% theta=0:2*pi/m:2*pi ;
% phi=-pi/2:pi/10:pi/2 ;
% [T,P] = meshgrid(theta,phi) ;
% X1 = xo + r *cos(P).* cos(T);
% Y1 = yo + r *cos(P).* sin(T);
% Z1 = zo + r *sin(P) ;
% 
% plot3(X1,Y1,Z1);
% hold on

x0 = 0;
y0 = 0;
r = 1;

% [X,Y] = circ(x0,y0,r);

[X1,Y1] = rombo(x0,y0,r);
plot(X1,Y1);
hold on 
[X2,Y2] = circ(x0,y0,r);
plot(X2,Y2);

for i=1:0.4:3
  X = [X X*i NaN];
  Y = [Y Y*i NaN];
  
  plot(X,Y);
    
end

% C = complex(X,Y);
% 
% [Xe,Ye,Ze] = comp2esf(C);
% disp(Xe);
% disp(Ye);
% disp(Ze);
% plot3(Xe,Ye,Ze);




function [X,Y,Z] = comp2esf(z)
X = (2*real(z))/(norm(z)^2 + 1);
Y = (2*imag(z))/(norm(z)^2 + 1);
Z = ((norm(z)^2 - 1))/(norm(z)^2 + 1);
end

function [X,Y] = circ(x0,y0,r)
X = linspace(x0-r,x0+r,20);
Y = sqrt(r^2-X.^2);
X = [X fliplr(X)];
Y = [Y -fliplr(Y)] + y0;
end

function [X,Y] = rombo(x0,y0,c)
X = [x0-c,x0,x0+c,x0,x0-c];
Y = [y0,y0-c,y0,y0+c,y0];
end

