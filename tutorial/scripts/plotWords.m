figure();clf;
mdlDK = fitWords(ageDK,wordsDK);
mdlOt = fitWords(ageOt,wordsOt);
xnew = 0:0.1:12;
scatter(ageDK,wordsDK,'x','HandleVisibility','off');
hold on
% Dummy plot to reuse last color
h = plot(nan(2,size(get(gca,'colororder'),1)-1)); delete(h);
plot(xnew,mdlDK(xnew),'LineWidth',2,'DisplayName','Danish')
scatter(ageOt,wordsOt,'x','HandleVisibility','off');
% Dummy plot to reuse last color
h = plot(nan(2,size(get(gca,'colororder'),1)-1)); delete(h);
plot(xnew,mdlOt(xnew),'LineWidth',2,'DisplayName','Other')

mdlBoth = fitWords([ageDK; ageOt],[wordsDK; wordsOt]);
plot(xnew,mdlBoth(xnew),'k--','LineWidth',2,'DisplayName','Both')

xlabel('Age [years]')
ylabel('Vocabulary [words]')
legend;
ltxFormat;