function v_disp = v_disparite(disparityMap,range,Ig)
    %Inputs :
    % disparityMap est la carte de disparit�
    % range : intervalle de disparit�
    % Ig : l'adresse de l'image de gauche de type chaine de caractere. Ex : '01G.png'
    %Outputs :
    % Carte v-disparit� en gray 
    % Carte v-disparit� en color
    % Histogramme du nombre d'appariements pour chaque couple de valeurs
    % (v, disparit� )
    
    %% Image de gauche
    Ig=rgb2gray(double(imread(Ig))/255);
    % creation matrice 
    v_disp=zeros(size(Ig,1),size(disparityMap,1));
    %% construction v-disparity
    for i=1:size(disparityMap,1)
        for k=1:96
            for j=1:size(disparityMap,2)
                if round(disparityMap(i,j)+1)==k
                    v_disp(i,k)= v_disp(i,k)+1;
                end
            end
        end
    end
    % affichage des r�sultat 
    figure;
    ax1=subplot(2,1,1);
    imshow([disparityMap v_disp],range)
    title('Carte v-disparit� en gray')
    colormap(ax1,'gray')

    ax1=subplot(2,1,2);
    imshow([disparityMap v_disp],range)
    title('Carte v-disparit� en color')
    colormap(ax1,'jet')

end 