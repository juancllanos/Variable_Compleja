x=linspace(-2,1,800);
y=linspace(-1.5,1.5,800);
[X,Y]=meshgrid(x,y);

Image = zeros(length(x),length(y));

% Blanco y negro %

% for i=1:length(x)
%     for j=1:length(y)
%         c = complex(x(i),y(j));
%         [bool,k] = conver(c);
%         if bool == 1
%             Image(j,i) = 1;
%         else
%             Image(j,i) = 0;
%         end
%     end
%     
% end

% Color %

for i=1:length(x)
    for j=1:length(y)
        c = complex(x(i),y(j));
        [bool,k] = conver(c);
        Image(j,i) = mod(k + norm(c),255);
    end
    
end


figure,
imagesc(Image);
colormap(winter)


function [bool,k] = conver(a)
x0 = a;
maxiter = 100;
for i=1:maxiter
    x0 = x0^2 + a;
    if i ~= maxiter & norm(x0) > 10
        bool = 0;
        k = i;
    elseif i == maxiter & norm(x0) > 10
        bool = 0;
        k = maxiter;
    else 
        bool = 1;
        k = 0;
    end 
end
end