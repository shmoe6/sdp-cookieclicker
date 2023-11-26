%% globalVariables.m
%% author: anna bontempo

%% top level variables for use throughout the project
classdef globalVariables
    properties
        %% sprites

        % empty sprites
        empty = 19;

        % big cookie sprites
        cookie1 = 1;
        cookie2 = 2;
        cookie3 = 3;
        cookie4 = 6;
        cookie5 = 7;
        cookie6 = 8;
        cookie7 = 11;
        cookie8 = 12;
        cookie9 = 13;

        % upgrade sprites
        smallCookie = 4;
        cursor = 5;
        chef = 9;
        powerClick = 10;
        tree = 14;
        mine = 15;
        factory = 16;
        research = 17;
        monopoly = 18;
        
        %% upgrade variables
        % set up variables to hold number, base cost, percent boost of each
        % done in an array, in the following order:
        % [cursor, powerClick, chef, tree, mine, factory, research, monopoly]
        numUpgrades = zeros(1, 8);
        baseCosts = [15 100 1100 12000 130000 1400000 20000000 33000000];
        baseBoost = [.1 1 8 47 260 1400 7800 44000];
        
        %% gamestate data
        % store cookie statistics
        numCookies = 0;
        cookieRate = 0;

        % variables to hold each screen
        % 19 is empty sprite
        mainMenu = 19 * ones(5);
        gameScene = 19 * ones(9);
        shopScene = 19 * ones(9);

        % text variables for editing purposes
        editableText = text();
        textW = 0;
        textH = 0;
    end
end