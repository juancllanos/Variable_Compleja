X = [];
Y = [];
Z = [];

R = [];
I = [];

n = 1;
for i=-2:0.5:2
    a = complex(i,2);
    [xa,ya,za]  = comp2esf(a);
    R(n) = real(a);
    I(n) = imag(a);
    X(n) = xa;
    Y(n) = ya;
    Z(n) = za;
    n = n+1;
end

plot(R,I);

r = 1;
xo = 0;
yo = 0;
zo = 0;
m =20;
n = 10;
theta=0:2*pi/m:2*pi ;
phi=-pi/2:pi/10:pi/2 ;
[T,P] = meshgrid(theta,phi) ;
X1 = xo + r *cos(P).* cos(T);
Y1 = yo + r *cos(P).* sin(T);
Z1 = zo + r *sin(P) ;

plot3(X1,Y1,Z1);
hold on
plot3(X,Y,Z);



function [X,Y,Z] = comp2esf(z)
X = (2*real(z))/(norm(z)^2 + 1);
Y = (2*imag(z))/(norm(z)^2 + 1);
Z = ((norm(z)^2 - 1))/(norm(z)^2 + 1);
end

function [X,Y] = esf2comp(x,y,z)
X = x/(1-z);
Y = y/(1-z);
end