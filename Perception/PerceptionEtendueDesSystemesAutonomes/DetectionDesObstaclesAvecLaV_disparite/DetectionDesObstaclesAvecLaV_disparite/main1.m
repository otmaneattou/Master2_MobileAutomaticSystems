clc; close all; clear all; 

%% Partie 1 : Calcul de disparités
range =[0 96];
dispariteSGM=calculDeDisparite('01D.png','01G.png', range);

%% Partie 2 : Détection des obstacles

%% Q1 : v-disparité
v_disp = v_disparite(dispariteSGM, range,'01G.png');


%% Q2 : Profil de la route
figure
for svd = 1 :9
    b = profilDeLaRoute(v_disp , svd );
end 
b = profilDeLaRoute(v_disp , 1 );
%% Q3 : Obstacles : 
for s_obstacle = 6 :9
    figure('Name',sprintf('s_obstacle=%d',s_obstacle));
    histo = obstacles(v_disp, b, range, s_obstacle,'01D.png' );
end

%On valide les parametres suivants : 
% range = [0 96]; svd = 1; s_obstacle =9;
%% Q4 : Sur les images  02G et 02D

range =[0 96];
dispariteSGM=calculDeDisparite('02D.png','02G.png', range);
v_disp = v_disparite(dispariteSGM, range,'02G.png');
figure
for svd = 1 :9 
    b = profilDeLaRoute(v_disp , svd );
end 
%on  valide svd =5
b = profilDeLaRoute(v_disp , 5 );

for s_obstacle = 6 :9
    figure('Name',sprintf('s_obstacle=%d',s_obstacle));
    histo = obstacles(v_disp, b, range, s_obstacle,'02D.png' );
end
% Par mesure de sécurité, on valide s_obstacle =6
s_obstacle =6;
figure('Name',sprintf('s_obstacle=%d',s_obstacle));
histo = obstacles(v_disp, b, range, s_obstacle,'02D.png' );

%% Q5 : Sur les images  03G et 03D

range =[0 96];
dispariteSGM=calculDeDisparite('03D.png','03G.png', range);
v_disp = v_disparite(dispariteSGM, range,'03G.png');
figure
for svd = 1 :9 
    b = profilDeLaRoute(v_disp , svd );
end 
%on  valide svd =5
b = profilDeLaRoute(v_disp , 1 );

for s_obstacle = 10 :12
    figure('Name',sprintf('s_obstacle=%d',s_obstacle));
    histo = obstacles(v_disp, b, range, s_obstacle,'03D.png' );
end
% Par mesure de sécurité, on valide s_obstacle =6
s_obstacle =6;
figure('Name',sprintf('s_obstacle=%d',s_obstacle));
histo = obstacles(v_disp, b, range, s_obstacle,'03D.png' );

% Avec les valeurs de svd = 5 et s_obstacle = 6, le résultat n'est pas bon
% On conclut ainsi, qu'il faut reparamétrer

% Par mesure de sécurité, on valide s_obstacle =12
s_obstacle =12;
figure('Name',sprintf('s_obstacle=%d',s_obstacle));
histo = obstacles(v_disp, b, range, s_obstacle,'03D.png' );