% % % % % % % % % % % % % % % % % % % % % % % % %

% Calcula un índice de porosidad en las
% imágenes de microscopio.

clc

% Lectura de imagenes.
r1 = imread('A0.tif','tif');
r2 = imread('B0.tif','tif');

% Calcula la FFT en 2D.
fftr1 = fftshift(fft2(r1,256,256));
mr1 = abs(fftr1);
fftr2 = fftshift(fft2(r2,256,256));
mr2 = abs(fftr2);

im1 = log(1+mr1);
im2 = log(1+mr2);

% Graficar.
figure(1), imshow(im1,[])
figure(2), imshow(im2,[])

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
pA0 = sum1 / (256*256)
pB0 = sum2 / (256*256)


% % % % % % % % % % % % % % % % % % % % % % % % %