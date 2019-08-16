x=linspace(-2,1,1000);
y=linspace(-1.5,1.5,1000);
maxiter = 100;




% Mandelbrot a blanco y negro %
Image = zeros(length(x),length(y));
for i=1:length(x)
    for j=1:length(y)
        c = complex(x(i),y(j));
        [bool,k] = conver(c,maxiter);
        if bool == 1
            Image(j,i) = 0;
        else
            Image(j,i) = 1;
        end
    end
    
end
imshow(Image);

% Mandelbrot a color %
% Image = zeros(length(x),length(y));
% for i=1:length(x)
%     for j=1:length(y)
%         c = complex(x(i),y(j));
%         [bool,k] = conver(c,maxiter);
%         Image(j,i) = k;
%         
%     end
% end
% 
% map = [   0.0417         0         0
%           0.2500         0         0
%           0.4167         0         0
%           0.6250         0         0
%           0.7917         0         0
%           0.8750         0         0
%           0.9583         0         0  
%       
%     ];
%  imshow(Image,map);




% -- Funcion de convergencia -- %
function [bool,k] = conver(a,maxiter)
x0 = a;
for i=1:maxiter
    x0 = x0^2 + a;
    k = i;
    if i ~= maxiter && norm(x0) >= 10
        bool = 0;
        break;
    elseif i == maxiter && norm(x0) >= 10
        bool = 0;   
    elseif i == maxiter && norm(x0) < 10
        bool = 1;
        k = 0;        
    end
end
end