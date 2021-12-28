function m12 = Regle_Dempster(S1,S2)
indice_C2=2;indice_C3=4;indice_C1uC3 = 5;indice_C1uC2 = 3;

m12 = zeros(size(S1));
%S12 = Regle_Dempster(S1,S2);  % completer Regle_Dempster
% Classe C1
m12(:,:,1) = S1(:,:,indice_C1uC3)*S2(:,:,indice_C1uC2);%% A completer
% Classe C2
m12(:,:,2) = S1(:,:,indice_C2)*S2(:,:,indice_C1uC2);%% A completer (/!\ au pixel � pixel)
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
% I_conj = zeros(size(I1,1),size(I1,2),size(I1,3));
% 
% % vecteur element focaux
% EltF_ok=zeros(size(I1,3),2);
% for i=1:size(I1,3)
%     if sum(sum(I1(:,:,i))) >0
%         EltF_ok(i,1) = 1;
%     end
%     if sum(sum(I2(:,:,i))) >0
%         EltF_ok(i,2) = 1;
%     end
% end
% 
% % regle conjonctive sans normalisation
% for i=1:size(I1,3)
%     for j=1:size(I1,3)
%         
%         
%             % ******************************
%             % **** début compléter *********
%             
% 
%             % **** Fin compléter ***********
%             % ******************************
%    
%         
%     end
end

