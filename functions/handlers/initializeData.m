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

    % variables to hold each screen
    % 19 is empty sprite
    dataOut.mainMenu = 19 * ones(5);
    dataOut.gameScene = 19 * ones(9);
    dataOut.shopScene = 19 * ones(9);

    dataOut.currentScreen = "Main Menu";
end