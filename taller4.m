% Esfera 
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

% X = randn(100);
% Y = randn(100);
% C = complex(X,Y);
% 
% [X1,Y1,Z1] = comp2esf(C);
% 
% plot3(X1,Y1,Z1,'o');

% r = 1;
% x0 = 1;
% y0 = 0;
% [X,Y] = circ(x0,y0,r);
% plot(X,Y);
% 
% x0 = 3;
% y0 = 4;
% c = 2;
% [X,Y] = rombo(x0,y0,c);
% 
% plot(X,Y);

% x0 = 3;
% y0 = 4;
% c = 2;
% [X,Y] = triang(x0,y0,c);
% 
% plot(X,Y);




function [X,Y,Z] = comp2esf(z)
X = (2*real(z))./(abs(z).^2 + 1);
Y = (2*imag(z))./(abs(z).^2 + 1);
Z = ((abs(z).^2 - 1))./(abs(z).^2 + 1);
end

% FIGURAS %
function [X,Y] = circ(x0,y0,r)
X = linspace(x0-r,x0+r,40);
Y = sqrt(r^2 - X.^2);
X = [NaN X fliplr(X) NaN];
Y = [NaN Y -fliplr(Y) NaN]+y0;
end

function [X,Y] = rombo(x0,y0,c)
X = [x0-c,x0,x0+c,x0,x0-c,NaN];
Y = [y0,y0-c,y0,y0+c,y0,NaN];

for i=1:5
    X = [X i*X];
    Y = [Y i*Y];
end

end

function [X,Y] = triang(x0,y0,c)
X = [x0-c,x0,x0+c,x0-c,NaN];
Y = [y0,y0+c,y0,y0,NaN];
for i=1:5
    X = [X i*X];
    Y = [Y i*Y];
end
end





