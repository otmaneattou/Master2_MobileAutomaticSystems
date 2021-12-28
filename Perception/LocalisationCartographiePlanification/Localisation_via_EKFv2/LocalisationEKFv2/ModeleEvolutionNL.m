%****************************************************************************************
% ModeleEvolutionNL
% Module de calcul des différentes matrices et structures utilisées par l'EKF 
% 
% Fichier          : $RCSfile: ModeleEvolutionNL.m,v $
% Auteur           : Dominique Gruyer 						
%	
% Auteurs :
%  Dominique Gruyer: 	1) Developpement du code principal
%						2) Calcul des étapes suivantes:
%                               matrice jacobienne du modele d'évolution: Fk = dfk/dxk
%                               matrice jacobienne du modele d'évolution: Bk = dfk/duk
%                               matrice de mesure: Hk
%                               matrice de bruit d'état et de mesure
%****************************************************************************************/
function [Fk,Hk,Bk,Q_systeme]=ModeleEvolutionNL(var_S,var_teta_c,teta_c,VarSysteme,Psi);

   %================================================================         
   % DEFINITION DU MODELE D'EVOLUTION ET DE LA PREMIERE PREDICTION
   %================================================================
	% calcul de la premiere position prédite du véhicule
   %======================================================
   R = 0.3;						% rayon de la roue
   E = 1;						% longueur de l'essieu
   pas_codeur=.1954;
   
	% matrice jacobienne du modele d'évolution: Fk = dfk/dxk
	%========================================================

	
	
	

      
	% matrice jacobienne du modele d'évolution: Bk = dfk/duk
	%========================================================


	
	
	

	% matrice de mesure: Hk 
	%========================================================
 
   
   
   
   
   %========================================================         
   % CALCUL DE LA MATRICE DE BRUIT SUR L'ENTREE DU SYSTEME
   %======================================================== 
      
 
            
                
                
 