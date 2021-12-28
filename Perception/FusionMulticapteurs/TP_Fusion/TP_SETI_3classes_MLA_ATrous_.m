%%%%%%%%%%%%%%%%%%%% TP 3 : FUSION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% classification par fusion d'image en fonction de croyance

% II - CLASSIFICATION 3 CLASSES a partir de sources bruitées

% clear; clc; 
 close all

addpath(genpath('Fonctions'));

%% Chargement et affichage des images

Im1 = double(imread('ima_dat1.png'))/255;
Im2 = double(imread('ima_dat2.png'))/255;

subplot(1,2,1)
imshow(Im1); title('m_1(C2)');
subplot(1,2,2)
imshow(Im2); title('m_2(C1uC2)');

%% Qu.1  Allocation des masses sur les 3 classes
close all;
S1 = zeros(size(Im1,1),size(Im1,2),8);
S2 = zeros(size(Im2,1),size(Im2,2),8);

% image 1 a  deux classes : C2 (010) et C1 U C3 (101)
q = quantizer([2 1]);
indice_C2    = 2;%010 représente 2  
indice_C1uC3 = 3;%101 représente 5 

S1(:,:,indice_C2)    = Im1;%% ;
S1(:,:,indice_C1uC3) = 1-Im1;%% ;

% image 2 a  deux classes : C3 (100) et C1 U C2 (011)
indice_C3    = 4;  %100 représente 4
indice_C1uC2 = 3; %%011 représente 3

S2(:,:,indice_C1uC2) = 1-Im2;%%;
S2(:,:,indice_C3)    = Im2; %%;

% Affichage des 4 elements focaux : C2, C3, C1uC3, C1uC2 
figure, 
subplot(2,2,1), imshow( S1(:,:,indice_C2) ), title('S1(C2)'); 
subplot(2,2,2), imshow( S2(:,:,indice_C3) ), title('S2(C3)'); 
subplot(2,2,3), imshow( S1(:,:,indice_C1uC3) ), title('S1(C1 u C3)'); 
subplot(2,2,4), imshow( S2(:,:,indice_C1uC2) ), title('S2(C1 u C2)'); 

%% Qu.2  Coder la règle conjonctive pour plus de 2 classes
m12 = zeros(size(S1));
%S12 = Regle_Dempster(S1,S2);  % completer Regle_Dempster
% Classe C1
m12(:,:,1) = S1(:,:,indice_C1uC3)*S2(:,:,indice_C1uC2);%% A completer
% Classe C2
m12(:,:,2) = S1(:,:,indice_C2)*S2(:,:,indice_C1uC2);%% A completer (/!\ au pixel à pixel)
% Classe C3 
m12(:,:,3) = S2(:,:,indice_C3)*S1(:,:,indice_C1uC3);
% Classe C1UC2 
m12(:,:,4) = 0;
% Classe C1UC3
m12(:,:,5) = 0;
% Classe C2UC3
m12(:,:,6) = 0;
% Classe C1UC2UC3
m12(:,:,7) = 0;
% Classe 0
m12(:,:,8) = 0;
%% Qu.3  Reprendre les questions qu2 à qu6 

%% EROSION - Appliquer une erosion sur l'image

nbr_er=1; % Nombre de fois erosion
d_er=2; % Taille de l'element structurant   %% A FAIRE VARIER

% Erosion sur l'image
S1_erd = erosion_Im(S1,d_er,nbr_er);   % completez dans la fonction (ou alors utiliser avec fonction imerode, imopen, et strel pour l'element structurant) 
S2_erd = erosion_Im(S2,d_er,nbr_er);

% Affichage des 4 elements focaux : C2, C3, C1uC3, C1uC2 
figure, 
subplot(2,2,1), imshow( S1_erd(:,:,indice_C2) ), title({'C2' 'apres erosion'}); 
subplot(2,2,2), imshow( S2_erd(:,:,indice_C3) ), title({'C3' 'apres erosion'}); 
subplot(2,2,3), imshow( S1_erd(:,:,indice_C1uC3) ), title({'C1 u C3' 'apres erosion'}); 
subplot(2,2,4), imshow( S2_erd(:,:,indice_C1uC2) ), title({'C1 u C2' 'apres erosion'}); 

%% EROSION - Calcul de l'ignorance = m(Omega) = m(AuB)

% Calcul de l'ignorance (a completer)   
indice_C1uC2uC3 = 7;   %%); % indice_Omega

S1_erd(:,:,indice_C1uC2uC3) = erosion_Im(S1(:,:,7),d_er,nbr_er);%%);
S2_erd(:,:,indice_C1uC2uC3) = erosion_Im(S2(:,:,7),d_er,nbr_er);%%;

% Affichage de S(Omega)
figure, 
subplot(1,2,1), imshow(S1_erd(:,:,indice_C1uC2uC3)); title('Ignorance Source 1');
subplot(1,2,2), imshow(S2_erd(:,:,indice_C1uC2uC3)); title(' Ignorance Source 2');

%% EROSION -  Combinaison conjonctive des bbas
indice_C1uC3  = 5;

S12_erd = Regle_Dempster(S1_erd,S2_erd);

%% EROSION -  Calcul des BetP et décision 
 
Dec_erd = Decision(S12_erd); %% Completer la fonction

figure, imshow(Dec_erd,[]), title ({'Decision avec Erosion' ['d = ' num2str(d_er)]});


%% OUVERTURE - Appliquer une ouverture sur l'image

% Erosion sur l'image
S1_op = dilatation_Im(S1_erd,d_er,nbr_er);   % completez dans la fonction (ou alors utiliser avec fonction imerode, imopen, et strel pour l'element structurant) 
S2_op = dilatation_Im(S2_erd,d_er,nbr_er);

% Affichage des 4 elements focaux : C2, C3, C1uC3, C1uC2 
figure, 
subplot(2,2,1), imshow( S1_op(:,:,indice_C2) ), title({'C2' 'apres ouverture'}); 
subplot(2,2,2), imshow( S2_op(:,:,indice_C3) ), title({'C3' 'apres ouverture'}); 
subplot(2,2,3), imshow( S1_op(:,:,indice_C1uC3) ), title({'C1 u C3' 'apres ouverture'}); 
subplot(2,2,4), imshow( S2_op(:,:,indice_C1uC2) ), title({'C1 u C2' 'apres ouverture'}); 

% %% EROSION - Calcul de l'ignorance = m(Omega) = m(AuB)
% 
% % Calcul de l'ignorance (a completer)   
% indice_C1uC2uC3 = bin2num(%%); % indice_Omega
% 
% S1_op(:,:,indice_C1uC2uC3) = %%;
% S2_io(:,:,indice_C1uC2uC3) = %%;
% 
% % Affichage de S(Omega)
% figure, 
% subplot(1,2,1), imshow(S1_op(:,:,indice_C1uC2uC3)); title(' Ignorance Source 1');
% subplot(1,2,2), imshow(S2_op(:,:,indice_C1uC2uC3)); title(' Ignorance Source 2');
% 
% %% EROSION -  Combinaison conjonctive des bbas
% 
% S12_op = Regle_Dempster(S1_op,S2_op);
% 
% %% EROSION -  Calcul des BetP et décision 
% 
% Dec_op = Decision(S12_op); %% Completer la fonction
% 
% figure, imshow(Dec_op,[]), title ({'Decision avec Erosion' ['d = ' num2str(d_er)]});
% 
% %% COMPARAISON 
% %close all,
% figure, 
% subplot(1,2,1), imshow(Dec_erd,[]), title ({'Decision avec Erosion' ['d = ' num2str(d_er)]});
% subplot(1,2,2), imshow(Dec_op,[]), title ({'Decision avec Ouverture' ['d = ' num2str(d_er)]});