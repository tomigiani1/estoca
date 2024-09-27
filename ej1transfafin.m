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
