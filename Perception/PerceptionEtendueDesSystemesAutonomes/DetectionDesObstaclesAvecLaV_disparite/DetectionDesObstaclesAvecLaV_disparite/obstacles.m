function histo = obstacles(v_disp, b, range, s_obstacle, Id)
    %Inputs : 
    % v_disp : est la v-disparit�
    % b : le r�sultat de la fonction robustfit
    % range : intervalle de disparit�
    % svd : seuil obstacle
    % Id : l'adresse de l'image de droite de type chaine de caractere. Ex : '01D.png'
    %Outputs : 
    % figure 1 : Histogramme en disparit�
    % figure 2 : D�tection d'obstacle
    
    histo=zeros(size(v_disp,2));% cr�ation d'un tableau de 1D
    for i=1:size(v_disp,2) % parcour de l'image suivant les colonnes 
        for j=1:size(v_disp,1)
            if v_disp(j,i)>s_obstacle
                histo(i)=histo(i)+1; % incr�mentation de la valeur du tableau lorsque une valeur sup�rieur � s_obstacle
            end
        end    
    end
    subplot(1,2,1);
    plot(histo); % affichage de l'histogramme 
    title('Histogramme en disparit�');

    obstacle=zeros(size(histo));
    for max=1 : length (histo)
        if histo(max)> s_obstacle
            obstacle(max)=1;
        end
    end
    max=range(2);
    while obstacle(max)~= 1
        max=max-1;
    end
    Y=b(1)+b(2).*max;
    subplot(1,2,2);
    % affichage de la ligne jusqu'a laquelle il n ya pas d'obstacle sur l'image original
    Id=rgb2gray(double(imread(Id))/255);
    imshow(Id); 
    title("D�tection d'obstacle");
    hold on
    plot(0:size(Id,2),Y+0*(0:size(Id,2)),'r');
end 