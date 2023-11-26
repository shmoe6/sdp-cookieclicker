%% toShopScene.m
%% author: anna bontempo

%% updates the current screen to the shop screen.
function toShopScene(engine, data)
    % clear previous figure
    clf
    
    % shop ui
    % data.shopScene = 19 * ones(9);
    data.shopScene(:, 1) = [data.empty, data.cursor, data.powerClick...
                            data.chef, data.tree, data.mine, data.factory...
                            data.research, data.monopoly];
    drawScene(engine, data.shopScene);
    
    % get new figure dimension to render number of upgrades
    pos = get(gcf, 'Position'); % gives x left, y bottom, width, height
    width = pos(3);
    height = pos(4);
    
    % show number of each upgrade
    textHeights = linspace(1, height * 5, 9) + 180;
    for i = 1:8
        text(width, textHeights(i + 1), int2str(data.numUpgrades(i)), FontSize=24);
        text(width * 2, textHeights(i + 1), int2str(data.baseCosts(i)), FontSize=24);
        text(width * 3.25, textHeights(i + 1), string(data.baseBoost(i)), FontSize=24);
        % will become the buy button
        text(width * 4.5, textHeights(i + 1), "BUY", FontSize=24, FontWeight="bold");
    end
    
    % label for each column
    text(width/2, height/3, "# Purchased", FontSize=24);
    text(width * 2, height/3, "Cost", FontSize=24);
    text(width * 3, height/3, "Boost (cookies/s)", FontSize=24);

    data.currentScreen = "Shop Screen";
end