function I_erd = dilatation_Im(Im,d, n)
nl = size(Im,1);
nc = size(Im,2);
nClass = size(Im,3);
I_erd=Im;

% Vecteur element focaux
EltF_ok=zeros(nClass);
for i=1:size(Im,3)
    if sum(sum(Im(:,:,i))) >0
        EltF_ok(i) = 1;
    end
end

% Dilatation

% Pour chaque iteration de dilatation
for o=1:n
    % Pour chaque classe 
    for k=1:size(Im,3)
        % Si �l�ment focal 
        if EltF_ok(k) == 1
            
            % Application du filtre sur l'image
            for i=1:nl
                for j=1:nc
                    
                   I_erd(i,j,k) =  % Partie � compl�ter 
                
                end
            end
            
        end
    end
    Im = I_erd;
end