%****************************************************************************************
% PredictionKalmanNL
% Module de pr�diction de l'�tat du syst�me  
% 
% Fichier          : $RCSfile: PredictionKalmanNL.m,v $
% Auteur           : Dominique Gruyer 						
%	
% Auteurs :
%  Dominique Gruyer: 	1) Developpement du code principal
%						2) Calcul des �tapes suivantes:
%                               Pr�diction de l'�tat du syst�me
%								Calcul de la nouvelle matrice de variance-covariance pr�dite
%************************************************************************************************/
function [X_P,P_P]=PredictionKalmanNL(var_S,var_teta,Fk,X_E,P_E,Q_systeme,AngleRoue);


% calcul du vecteur d'�tat pr�dit X(k/k-1)
%==================================================



% calcul de la variance de la prediction P(k/k-1)
%==================================================

