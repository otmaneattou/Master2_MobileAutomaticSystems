%****************************************************************************************
% EstimationKalmanNL
% Module de mise à jour et de correction du vecteur d'état  
% 
% Fichier          : $RCSfile: EstimationKalmanNL.m,v $
% Auteur           : Dominique Gruyer 						
%	
% Auteurs :
%  Dominique Gruyer: 	1) Developpement du code principal
%						2) Calcul des étapes suivantes:
%                               Calcul du résidu
%								Calcul du gain
%								Calcul de la nouvelle estimée 
%								Calcul de la nouvelle matrice de variance-covariance estimée
%************************************************************************************************/
function [X_E,P_E,Sk]=EstimationKalmanNL(P_P,Hk,X_P,Y_GPS,Q_GPS); 

% P_P: Matrice de variance covariance sur la prediction
% Hk: Matrice de mesure. Cette matrice est une matrice de transfert entre la mesure et le vecteur d'état
% X_P: vecteur d'état prédit
% Y_GPS: donnée GPS, (X,Y)
% Q_GPS: bruit de GPS

    %==================================
   	% ETAPE D'ESTIMATION : instant k/k
   	%==================================
   
	% calcul de :
	%					      -1
	% Kk = P(k/k-1)H(k)'(H(k)P(k/k-1)H(k)' + R(k))
	% X_E(k/k) = X_E(k/k-1) + Kk(Y(k) - Y_E(k/k-1))
	% P(k/k) = P(k/k-1) - KkH(k)P(k/k-1) = (I - KkH(k))P(k/k-1)
	%===========================================================
         
 
 
 
 
         
         