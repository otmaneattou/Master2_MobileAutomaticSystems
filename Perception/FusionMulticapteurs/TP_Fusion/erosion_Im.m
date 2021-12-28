function I_erd = erosion_Im(Im,d, n)

% Im = l'image 
% d = la taille de l'élément structurant 
% n = Combien d'erosions successives

nl = size(Im,1);
nc = size(Im,2);
nClass = size(Im,3);
I_erd=Im;

% Vecteur element focaux
EltF_ok=zeros(nClass);
for i=1:nClass
    if sum(sum(Im(:,:,i))) >0
        EltF_ok(i) = 1;
    end
end

%% Erosion

% Pour chaque iteration d'érosion
for o=1:n
    
    % Pour chaque classe ( A, B )
    for k=1:nClass
        
        % Verification que element focal
        if EltF_ok(k) == 1
            
            % Appliquer le filtre sur l'image 
            for i=1:nl %lignes
                for j=1:nc %colonnes
                    if (i-d >0) && (j-d>0) && (i+d < 128) && (j+d < 128) % Pour éviter le problème de dépassement des bords
                        I_erd(i,j,k) = min(min(Im(i-d:i+d,j-d:j+d,k)));  %% Partie à Completer
                    end
                end
            end
        end
    end
    
    Im = I_erd;
end