x=linspace(-2,1,800);
y=linspace(-1.5,1.5,800);



% Blanco y negro %
% Image = zeros(length(x),length(y));
% for i=1:length(x)
%     for j=1:length(y)
%         c = complex(x(i),y(j));
%         [bool,k] = conver(c);
%         if bool == 1
%             Image(j,i) = 0;
%         else
%             Image(j,i) = 1;
%         end
%     end
%     
% end
% imshow(Image);

% Color %
Image = zeros(length(x),length(y),3);
for i=1:length(x)
    for j=1:length(y)
        c = complex(x(i),y(j));
        [bool,k] = conver(c);
        Image(j,i,mod(k,3)+1) = mod(k*norm(c),255);
    end
end
imshow(Image);




function [bool,k] = conver(a)
x0 = a;
maxiter = 100;
for i=1:maxiter
    x0 = x0^2 + a;
    k = i;
    if i ~= maxiter & norm(x0) > 10
        bool = 0;
    elseif i == maxiter & norm(x0) > 10
        bool = 0;
    else 
        bool = 1;
        k = 0;
    end 
end
end