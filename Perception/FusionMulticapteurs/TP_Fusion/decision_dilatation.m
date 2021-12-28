function Dec_op = decision_dilatation(m1, m2,nbr_er, d_dl)
    m1_op  = dilatation_Im(m1,d_dl,nbr_er);  
    m2_op  = dilatation_Im(m2,d_dl,nbr_er);  
    % Calcul de l'ignorance (a completer)                       
    m1_op(:,:,3) = 1 - m1_op(:,:,1)-m1_op(:,:,2);
    m2_op(:,:,3) = 1 - m2_op(:,:,1)-m2_op(:,:,2);
    % Version 1 :  EN DUR 
    m12_op = zeros(size(m1));
    % Classe A
    m12_op(:,:,1) = m1_op(:,:,1).*m2_op(:,:,1)+m1_op(:,:,1).*m2_op(:,:,3)+m2_op(:,:,1).*m1_op(:,:,3);
    % Classe B
    m12_op(:,:,2) = m1_op(:,:,2).*m2_op(:,:,2)+m1_op(:,:,2).*m2_op(:,:,3)+m2_op(:,:,2).*m1_op(:,:,3);
    % Classe AuB
    m12_op(:,:,3) = m1_op(:,:,3).*m2_op(:,:,3);
    Dec_op = Decision(m12_op);
    
end 