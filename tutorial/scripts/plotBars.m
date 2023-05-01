figure();clf;
scatter(bodegas(:,1),bodegas(:,2),'o','LineWidth',1.3,'DisplayName','Bodegas')
hold on
scatter(cocktailbars(:,1),cocktailbars(:,2),75,'x','LineWidth',1.9,'DisplayName','Cocktail bars')
scatter(0,0,100,'*','k','LineWidth',3,'DisplayName','R\r{a}dhuspladsen')
legend;
ltxFormat();