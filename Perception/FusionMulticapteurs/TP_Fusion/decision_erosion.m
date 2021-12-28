function Dec_erd = decision_erosion(m1, m2,nbr_er, d_er)
    m1_erd = erosion_Im(m1,d_er,nbr_er);   % completez dans la fonction (ou alors utiliser avec fonction imerode, imopen, et strel pour l'element structurant) 
    m2_erd = erosion_Im(m2,d_er,nbr_er);
    % Calcul de l'ignorance (a completer)                       
    m1_erd(:,:,3) = 1-(m1_erd(:,:,1)+m1_erd(:,:,2));
    m2_erd(:,:,3) = 1-(m2_erd(:,:,1)+m2_erd(:,:,2));
    
    m12_erd = zeros(size(m1));
    m12_erd(:,:,1) = m1_erd(:,:,1)*m2_erd(:,:,1)+m1_erd(:,:,1)*m2_erd(:,:,3)+m2_erd(:,:,1)*m1_erd(:,:,3);%% A completer (/!\ au pixel à pixel)
    % Classe B
    m12_erd(:,:,2) = m1_erd(:,:,2)*m2_erd(:,:,2)+m1_erd(:,:,2)*m2_erd(:,:,3)+m2_erd(:,:,2)*m1_erd(:,:,3);
    % Classe AuB
    m12_erd(:,:,3) = m1_erd(:,:,3)*m2_erd(:,:,3);
    % Classe ensemble vide
    m12_erd(:,:,4) = 0;
    
    Dec_erd = Decision(m12_erd); %% Completer la fonction
end 