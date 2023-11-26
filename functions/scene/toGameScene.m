%% toGameScene.m
%% author: anna bontempo

%% loads the scene where clicking gameplay will take place
function toGameScene(engine, data)
    % clear previous figure
    clf
    
    % big cookie
    data.gameScene(4:6, 3:5) = [1:3; 6:8; 11:13];
    
    % sidebar with upgrade statistics
    data.gameScene(:, 8) = [data.cursor, data.powerClick, data.chef...
                       data.tree, data.mine, data.factory...
                       data.research, data.monopoly, data.empty];
    
    drawScene(engine, data.gameScene);
    
    % get new figure dimension to render number of upgrades
    pos = get(gcf, 'Position'); % gives x left, y bottom, width, height
    width = pos(3);
    height = pos(4);

    data.textW = width;
    data.textH = height;
    
    % show number of each upgrade
    textHeights = linspace(1, height * 5, 9) + 180;
    for i = 1:8
        text(width * 4.6, textHeights(i), int2str(data.numUpgrades(i)), FontSize=24);
    end
    
    % cookies and cookies/sec text
    %text(width/3, height/3, data.numCookies + " Cookies", FontSize=24);
    text(width*2, height/3, data.cookieRate + " Cookies/sec", FontSize=24);
    
    % shop button
    text(width * 4.2, textHeights(9) - 25, "SHOP", FontWeight='bold', FontSize=24);

    % set current screen to the game scene
    data.currentScreen = "Game Scene";
end