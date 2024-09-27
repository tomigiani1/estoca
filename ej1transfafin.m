close all
clear all
N= 2000;
mu_z= 0;
c_z= eye(2);
mu_z = [0 0];


%creo el vector Z
Z= mvnrnd (mu_z, c_z, N);

%creo el grafico

figure;
scatter(Z(1, :), Z(2, :));
hold on;


%creo las curvas de nivel 

[x1, x2] = meshgrid(linspace(-4, 4, 100), linspace(-4, 4, 100));
fZ = mvnpdf([x1(:) x2(:)], mu_z, c_z);
fZ = reshape(fZ, size(x1));
contour(x1, x2, fZ, 10, 'LineWidth', 2);


%grafico
title('Gráfico de dispersión de Z con curvas de nivel de f_Z(z)')
xlabel('Z_1')
ylabel('Z_2')
axis([-4 4 -4 4])
hold off


%Grafico los histogramas de cada componente de Z

figure;
subplot(1,2,1);
histogram(Z(:,1), 30, 'Normalization', 'pdf');
hold on;
z1_vals = linspace(-4, 4, 100);
pdf_z1 = normpdf(z1_vals, 0, 1); % Densidad teórica N(0,1)
plot(z1_vals, pdf_z1, 'r-', 'LineWidth', 2);
title('Histograma de Z_1 con densidad teórica');
hold off;

subplot(1,2,2);
histogram(Z(:,2), 30, 'Normalization', 'pdf');
hold on;
z2_vals = linspace(-4, 4, 100);
pdf_z2 = normpdf(z2_vals, 0, 1); % Densidad teórica N(0,1)
plot(z2_vals, pdf_z2, 'r-', 'LineWidth', 2);
title('Histograma de Z_2 con densidad teórica');
hold off;




%PARTE 2

% Cy

C_y= [0.7 0.8; 0.8 1.75];

mu_y= [0.8 1];


%calcula autovalores y autovectores
[P, Lambda]= eig(C_y);

A= P*Lambda^(0.5);

%luego transformo z a y
Y= (A*Z')'+mu_y;

%grafico y
figure;
scatter(Y(:,1), Y(:,2), 'r.')
hold on



%creo las curvas de nivel de la conjunta de y


[w1, w2] = meshgrid(linspace(-4, 4, 100), linspace(-4, 6, 100));
fy = mvnpdf([w1(:) w2(:)], mu_y, C_y);
fy = reshape(fy, size(w1));
contour(w1, w2, fy, 10, 'LineWidth', 2);

%grafico
title('Gráfico de dispersión de Y con curvas de nivel de f_Y(y)')
xlabel('Y_1')
ylabel('Y_2')
axis([-4 4 -4 6])
hold off


%grafico los histogramas
figure;
subplot(1,2,1);
histogram(Y(:,1), 30, 'Normalization', 'pdf');
hold on;
y1_vals = linspace(-4, 4, 100);
pdf_y1 = normpdf(y1_vals, mu_y(1), sqrt(C_y(1,1))); % Densidad teórica N(0.8, sqrt(0.7))
plot(y1_vals, pdf_y1, 'r-', 'LineWidth', 2);
title('Histograma de Y_1 con densidad teórica');
hold off;

subplot(1,2,2);
histogram(Y(:,2), 30, 'Normalization', 'pdf');
hold on;
y2_vals = linspace(-4, 6, 100);
pdf_y2 = normpdf(y2_vals, mu_y(2), sqrt(C_y(2,2))); % Densidad teórica N(1, sqrt(1.75))
plot(y2_vals, pdf_y2, 'r-', 'LineWidth', 2);
title('Histograma de Y_2 con densidad teórica');
hold off;
