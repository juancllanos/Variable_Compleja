% --> Para ejecutar correctamente este codigo deber�a comentar una de las
% dos representaciones para que trabaje bien, si tiene ambas
% representaciones descomentadas el programa presentara fallos, lo que debera
% descomentar es lo que esta entre dos '------------------------'.

x=linspace(-2,1,1000);
y=linspace(-1.5,1.5,1000);
maxiter = 100;
% --> Ac� creamos el eje real(x), imaginario(y) y la cantidad m�xima de
% iteraciones.




% Mandelbrot a blanco y negro %
% ---------------------------------------------------------------
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
% ---------------------------------------------------------------
% --> Creamos la imagen (Image) como una matriz de tama�o x por tama�o
% y.
% --> Iteramos sobre el eje x y sobre el eje y para armar los posibles
% n�meros complejos que se encuentren en estos intervalos. Ejecutamos la
% funci�n conver que nos dice si el n�mero evaluado converge o no la
% funci�n del conjunto de Mandelbrot. Si converge lo pinta de negro(0),
% sino entonces de blanco.
% --> Luego cuando se tenga los puntos pintados en la Imagen la imprimimos.


% Mandelbrot a color %
% ---------------------------------------------------------------
% Image = zeros(length(x),length(y));
% for i=1:length(x)
%     for j=1:length(y)
%         c = complex(x(i),y(j));
%         [bool,k] = conver(c,maxiter);
%         Image(j,i) = k;
%         
%     end
% end
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
 % ---------------------------------------------------------------
 % --> Aqui tambien se crea la imagen con el mismo principio.
 % --> Luego este for nos hace algo parecido al blanco y negro solo que aca
 % representa la imagen el valor de la maxima iteracion que obtuvo antes de
 % decidir que no convergia o cero si en su defecto converge.
 % --> Luego con este mapa basado en el mapa hot que trae Matlab lo que
 % hice fue darle valores que me interesasen a mi mapa para que asi la
 % imagen al tomar este mapa graficara de los valores menores a mayores por
 % conveniencia se tomo que si convergia k = 0. 

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
% --> En esta funcion simplemente evaluamos al funcion del criterio del
% conjunto de Mandelbrot y vamos viendo algunos casos.

% --> 1er caso : no se ha llegado a las maximas iteraciones pero la norma
% del numero ya paso a ser mayor o igual que 10, entonces el bool que me representa
% si el numero converge o no lo convierto en 0 (falso). Tom� 10 porque cre� que
% ten�a que comparar los n�meros complejos pero como no son comparables la
% norma me ayuda a saber que tan cerca del origen est� entonces el 10 lo
% que me dice es si esta muy lejos o no (en mi caso propio) de (0,0).

% --> 2do caso : lleg� a las maximas iteraciones y la norma es mayor o
% igual que 10, entonces bool = 0 porque no converge.

% --> 3er caso : Lleg� a las maximas iteraciones pero la norma del numero
% es menor que 10 entonces se puede decir que esta funcion converge para
% este numero, luego bool = 1 porque converge y k = 0 porque como converge
% no necesito saber la iteracion maxima que me dice que no converge, ademas
% me funciona para hacer la grafica de colores esta convencion.
