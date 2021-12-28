function b = profilDeLaRoute(v_disp , svd )
    %Inputs
    % v_disp : est la v-disparité
    % svd : seuil
    %Outputs 
    % b : le résultat de la fonction robustfit
    % Figure : La représentationde la ligne de la route sur l'histogramme
    
    prof_route = [];
    for i = 1:size(v_disp,1)
        for j = 1:size(v_disp,2)
            if v_disp(i,j) > svd
                prof_route = [prof_route;[i j]];
            end
        end
    end


    % fonction robustfit renvoie vecteur b
    b = robustfit(prof_route(:,2), prof_route(:,1));
    x = 0:size(v_disp,1);
    y = b(1) + b(2).*x;
    
    subplot(3,3,svd);
    imshow(v_disp);
    hold on
    % plotage de la ligne de la route en rouge
    plot(x,y,'r');
    title(sprintf('Detection de la route avec svd=%d',svd))
end 