%****************************************************************************************
% EstimationKalmanNL
% Module de mise � jour et de correction du vecteur d'�tat  
% 
% Fichier          : $RCSfile: EstimationKalmanNL.m,v $
% Auteur           : Dominique Gruyer 						
%	
% Auteurs :
%  Dominique Gruyer: 	1) Developpement du code principal
%						2) Calcul des �tapes suivantes:
%                               Calcul du r�sidu
%								Calcul du gain
%								Calcul de la nouvelle estim�e 
%								Calcul de la nouvelle matrice de variance-covariance estim�e
%************************************************************************************************/
function [X_E,P_E,Sk]=EstimationKalmanNL(P_P,Hk,X_P,Y_GPS,Q_GPS); 

% P_P: Matrice de variance covariance sur la prediction
% Hk: Matrice de mesure. Cette matrice est une matrice de transfert entre la mesure et le vecteur d'�tat
% X_P: vecteur d'�tat pr�dit
% Y_GPS: donn�e GPS, (X,Y)
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
         
 
 
 
 
         
         