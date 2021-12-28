%****************************************************************************************
% PredictionKalmanNL
% Module de prédiction de l'état du système  
% 
% Fichier          : $RCSfile: PredictionKalmanNL.m,v $
% Auteur           : Dominique Gruyer 						
%	
% Auteurs :
%  Dominique Gruyer: 	1) Developpement du code principal
%						2) Calcul des étapes suivantes:
%                               Prédiction de l'état du système
%								Calcul de la nouvelle matrice de variance-covariance prédite
%************************************************************************************************/
function [X_P,P_P]=PredictionKalmanNL(var_S,var_teta,Fk,X_E,P_E,Q_systeme,AngleRoue);


% calcul du vecteur d'état prédit X(k/k-1)
%==================================================



% calcul de la variance de la prediction P(k/k-1)
%==================================================

