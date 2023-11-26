%% initializeData.m
%% author: anna bontempo

%% processes data from globalVariables.m for use throughout project
function dataOut = initializeData(dataIn)

    dataOut = dataIn;
    %% sprites
    % empty sprites
    dataOut.empty = 19;

    % big cookie sprites
    dataOut.cookie1 = 1;
    dataOut.cookie2 = 2;
    dataOut.cookie3 = 3;
    dataOut.cookie4 = 6;
    dataOut.cookie5 = 7;
    dataOut.cookie6 = 8;
    dataOut.cookie7 = 11;
    dataOut.cookie8 = 12;
    dataOut.cookie9 = 13;

    % upgrade sprites
    dataOut.smallCookie = 4;
    dataOut.cursor = 5;
    dataOut.chef = 9;
    dataOut.powerClick = 10;
    dataOut.tree = 14;
    dataOut.mine = 15;
    dataOut.factory = 16;
    dataOut.research = 17;
    dataOut.monopoly = 18;

    %% upgrade variables
    % set up variables to hold number, base cost, percent boost of each
    % done in an array, in the following order:
    % [cursor, powerClick, chef, tree, mine, factory, research, monopoly]
    dataOut.numUpgrades = zeros(1, 8);
    dataOut.baseCosts = [15 100 1100 12000 130000 1400000 20000000 33000000];
    dataOut.baseBoost = [.1 1 8 47 260 1400 7800 44000];
    
    %% gamestate data
    % store cookie statistics
    dataOut.numCookies = 0;
    dataOut.cookieRate = 0;

    % variables to hold each screen
    % 19 is empty sprite
    dataOut.mainMenu = 19 * ones(5);
    dataOut.gameScene = 19 * ones(9);
    dataOut.shopScene = 19 * ones(9);

    dataOut.currentScreen = "Main Menu";

    dataIn = dataOut;
end