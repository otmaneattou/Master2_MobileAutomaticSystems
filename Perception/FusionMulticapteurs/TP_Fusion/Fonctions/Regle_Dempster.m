function I_conj = Regle_Dempster(I1,I2)

I_conj = zeros(size(I1,1),size(I1,2),size(I1,3));

% vecteur element focaux
EltF_ok=zeros(size(I1,3),2);
for i=1:size(I1,3)
    if sum(sum(I1(:,:,i))) >0
        EltF_ok(i,1) = 1;
    end
    if sum(sum(I2(:,:,i))) >0
        EltF_ok(i,2) = 1;
    end
end

% regle conjonctive sans normalisation
for i=1:size(I1,3)
    for j=1:size(I1,3)
        
        
            % ******************************
            % **** début compléter *********


            % **** Fin compléter ***********
            % ******************************
   
        
    end
end

