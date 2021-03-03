% % % % % % % % % % % % % % % % % % % % % % % % %

% Calcula un índice de porosidad en las
% imágenes de rejas.

clc

% - % Imagenes de Rejas.

% Reja 1.

% Crea una imágen negra de 256 x 1024.
r1 = zeros(256,1024);

% Crea x barras blancas verticales.
x1 = 16;
n1 = 1024/(2*x1);
for i1 = 0:(1024/(2*n1)-1)
    a1 = 1+2*i1*n1;
    b1 = a1+n1;
    r1(1:256,a1:b1) = 1;
end

figure(1), imshow(r1,'InitialMagnification','fit')

% Reja 2.

% Crea una imágen negra de 256 x 1024.
r2 = zeros(256,1024);

% Crea x barras blancas verticales.
x2 = 128;
n2 = 1024/(2*x2);
for i2 = 0:(1024/(2*n2)-1)
    a2 = 1+2*i2*n2;
    b2 = a2+n2;
    r2(1:256,a2:b2) = 1;
end

figure(2), imshow(r2,'InitialMagnification','fit')

% - %

% Calcula la FFT en 2D.
fftr1 = fftshift(fft2(r1,256,256));
mr1 = abs(fftr1);
fftr2 = fftshift(fft2(r2,256,256));
mr2 = abs(fftr2);

im1 = log(1+mr1);
im2 = log(1+mr2);

% Graficar.
figure(3), imshow(im1,[])
figure(4), imshow(im2,[])

% Suma las frecuencias obtenidas.
sum1 = 0;
for i = 1:256
    for j = 1:256
        sum1 = sum1 + im1(i,j);
    end
end

sum2 = 0;
for i = 1:256
    for j = 1:256
        sum2 = sum2 + im2(i,j);
    end
end

% Promedio.
pr1 = sum1 / (256*256)
pr2 = sum2 / (256*256)


% % % % % % % % % % % % % % % % % % % % % % % % %