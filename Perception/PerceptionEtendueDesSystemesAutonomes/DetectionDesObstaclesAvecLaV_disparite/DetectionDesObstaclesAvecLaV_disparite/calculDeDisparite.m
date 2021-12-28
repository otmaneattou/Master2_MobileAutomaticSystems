function dispariteSGM=calculDeDisparite(Id,Ig, range)
    % Id : l'adresse de l'image de droite de type chaine de caractere. Ex : '01D.png'
    % Ig : l'adresse de l'image de gauche de type chaine de caractere. Ex : '01G.png'
    % Cette fonction retourne les images prises au départ en niveau gris, les images superposées en anaglyphe  
    % et les carte de disparite de différentes fonctions
    
    %% lecture des images : 02D et 02G avec la normalisation
    Id=rgb2gray(double(imread(Id))/255);
    Ig=rgb2gray(double(imread(Ig))/255);

    %% affichage des images originales 
    figure;
    subplot(1,2,1);imshow(Id);title('Image 01D');
    subplot(1,2,2);imshow(Ig);title('Image 01G');

    %% combine les images 01D et 01G en un anaglyphe rouge-cyan
    ang = stereoAnaglyph(Ig,Id);
    % affichage des images 01D et 01G superposées 
    figure,imshow(ang);title("Superposition d'image 02D et 02G"); 
    
    %% calcul de disparité 

    %% carte disparité en utlisant Fonction Matlab "disparity"
    disparite=disparity(Ig,Id,'disparityRange',range);
    % affichage de disparité en gray et en color
    figure;
    ax1=subplot(3,2,1);
    imshow(disparite/range(2))
    title('Disparity avec Fct disparity')
    colormap(ax1,'gray')

    ax2=subplot(3,2,2);
    imshow(disparite/range(2))
    title('Disparity avec Fct disparity')
    colormap(ax2,'jet')
    colorbar

    %% carte disparité en utlisant Fonction Matlab "disparityBM"
    dispariteBM=disparityBM(Ig,Id,'disparityRange',range);
    % affichage de disparité en gray et en color

    ax1=subplot(3,2,3);
    imshow(dispariteBM/range(2))
    title('Disparity avec Fct disparityBM')
    colormap(ax1,'gray')

    ax2=subplot(3,2,4);
    imshow(dispariteBM/range(2))
    title('Disparity avec Fct disparityBM')
    colormap(ax2,'jet')
    colorbar

    %% carte disparité en utlisant Fonction Matlab "disparitySGM"
    dispariteSGM=disparitySGM(Ig,Id,'disparityRange',range);
    % affichage de disparité en gray et en color

    ax1=subplot(3,2,5);
    imshow(dispariteSGM/range(2))
    title('Disparity avec Fct disparitySGM')
    colormap(ax1,'gray')

    ax2=subplot(3,2,6);
    imshow(dispariteSGM/range(2))
    title('Disparity avec Fct disparitySGM')
    colormap(ax2,'jet')
    colorbar
    
    
end 