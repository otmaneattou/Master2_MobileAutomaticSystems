function BetP = calcul_BetP3classes(I)
% Rappel Def : BetP(omega) = somme ( m(A)/|A| ) pour tout A tel que omega appartient à A.

dim=log2(size(I,3));
BetP = ones(size(I,1),size(I,2),dim);

for i=1:size(I,1)
   for j=1:size(I,2)
           C1 = bin2dec('001'); C2 = bin2dec('010');C3 = bin2dec('100'); C1UC2 = bin2dec('011');
           C1UC3 = bin2dec('101');C2UC3 = bin2dec('110'); C1UC2UC3 = bin2dec('111'); setVide = bin2dec('000');
           BetP(i,j,1) = (I(i,j,C1)+I(i,j,C1UC2)/2+I(i,j,C1UC3)/2+I(i,j,C1UC2UC3)/3);%%
           BetP(i,j,2) = (I(i,j,C2)+I(i,j,C1UC2)/2+I(i,j,C2UC3)/2+I(i,j,C1UC2UC3)/3);%%
           BetP(i,j,3) = (I(i,j,C3)+I(i,j,C1UC3)/2+I(i,j,C2UC3)/2+I(i,j,C1UC2UC3)/3);%%
  
   end
end

end
