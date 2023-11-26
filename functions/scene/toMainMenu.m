%% toMainMenu.m
%% author: anna bontempo

%% updates the current screen to the main menu
function toMainMenu(engine, data)
 % clear previous figure
    clf
    
    % set up main menu
    data.mainMenu([1 end], [1 end]) = data.smallCookie;
    drawScene(engine, data.mainMenu);
    
    % get figure dimensions for text rendering purposes
    pos = get(gcf, 'Position'); % gives x left, y bottom, width, height
    width = pos(3);
    height = pos(4);
    
    % render text
    text(width * 1.25, height, "CookieClickPro", HorizontalAlignment="Center", FontSize=36);
    text(width * 1.25, height * 1.25, "Press any key to begin.", HorizontalAlignment="Center", FontSize=16);

    % set current screen to the main menu
    data.currentScreen = "Main Menu";
end