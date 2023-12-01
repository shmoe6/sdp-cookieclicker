%% cookieclickerpro.m
%% author: anna bontempo

%% script setup
clc
clf
clear
close all
clear sound

%% initial game setup

% create game engine
engine = simpleGameEngine("assets/CookieClicker.png", 84, 84, 5, [173 216 230]);

% store fps to be used by while loop
frameRate = 30;

% create struct of game data for use outside of main class
data = initializeData(struct());
disp(data);

% start on the main menu
toMainMenu(engine, data);

% avoid mouse problems
oldMousePos = [0, 0];
global mousePos;

% gamestate variables
cookiesText = text(738/3, 695/3, " ", FontSize=24);
rateText = text(738*2, 695/3, " ", FontSize=24);
numCookies = 1000;
cookieRate = 1;

numUpgrades = zeros(1, 8);
baseCosts = [15 100 1100 12000 130000 1400000 20000000 33000000];
baseBoost = [.1 1 8 47 260 1400 7800 44000];

%% game manager code
% this while loop checks to see the current scene and handles events
% according to this current scene
curFrame = 1;
while true

    % time management
    tic

    % set up event handlers
    engine.my_figure.KeyPressFcn = @(src, event)guidata(src, event.Key);
    engine.my_figure.KeyReleaseFcn = @(src, event)guidata(src, '0');
    key_down = guidata(engine.my_figure);
    engine.my_figure.WindowButtonDownFcn = @(src, event)clickHandler(src);
    
    %% main menu control
    if (data.currentScreen == "Main Menu")
        % prompt user for input, following the instruction on screen
        getKeyboardInput(engine);
        % pause(0.1);

        % after keyboard input received, start game
        data.currentScreen = "Game Scene";
        toGameScene(engine, data, numUpgrades);
    %% game scene control
    elseif (data.currentScreen == "Game Scene")
        % handle mouse click only if the mouse has changed positions
        if (oldMousePos ~= mousePos)
            oldMousePos = mousePos;

            % handle click of the shop button per coordinates below:
            %(x     y   )
            %(3000, 3500)
            %(3500, 3700)
            if (mousePos(1) >= 3000 && mousePos(1) <= 3500 ...
             && mousePos(2) >= 3500 && mousePos(2) <= 3700)
                data.currentScreen = "Shop Scene";
                toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);
            end
        end

        % update text
        delete(cookiesText);
        delete(rateText);
        cookiesText = text(738/3, 695/3, numCookies + " Cookies", FontSize=24);
        rateText = text(738*2, 695/3, cookieRate + " Cookies/sec", FontSize=24);
        
        % once per second, increase the cookie number based on the rate
        if (curFrame == 30)
            numCookies = numCookies + cookieRate;
        end

    %% shop scene control
    elseif (data.currentScreen == "Shop Scene")
        % clear out old text from main game scene
        delete(cookiesText);
        delete(rateText);

        % handle escape key press (go back to main game scene)
        if (key_down == "escape")
            toGameScene(engine, data, numUpgrades);
            data.currentScreen = "Game Scene";
        end

        % handle mouse click only if the mouse has changed positions
        if (oldMousePos ~= mousePos)
            oldMousePos = mousePos;

            % handle click of a buy button per coordinates below:
            %(x     y )
            %(3300, y1)
            %(3700, y2)
            if (mousePos(1) >= 3300 && mousePos(1) <= 3700)
                yCoord = mousePos(2);

                % check different y coords to see if a button was clicked:

                % buy cursor: 500 <= y <= 700
                if (isInRange(yCoord, 500, 700))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 1, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);

                % buy powerclick: 500 <= y <= 700
                elseif (isInRange(yCoord, 950, 1150))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 2, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);

                % buy chef: 1400 <= y <= 1600
                elseif (isInRange(yCoord, 1400, 1600))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 3, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);

                % buy tree: 1800 <= y <= 2000
                elseif (isInRange(yCoord, 1800, 2000))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 4, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);

                % buy mine: 2250 <= y <= 2450
                elseif (isInRange(yCoord, 2250, 2450))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 5, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);
                
                % buy factory: 2700 <= y <= 2900
                elseif (isInRange(yCoord, 2700, 2900))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 6, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);

                % buy research: 3100 <= y <= 3300
                elseif (isInRange(yCoord, 3100, 3300))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 7, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);

                % buy monopoly: 3550 <= y <= 3750
                elseif (isInRange(yCoord, 3550, 3750))
                    [numUpgrades, numCookies, cookieRate] = buy(baseCosts, numUpgrades, numCookies, 8, baseBoost, cookieRate);
                    toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);
                end

                toShopScene(engine, data, numUpgrades, baseCosts, baseBoost);
            end
            % used for debugging, can be deleted
            disp(["x" mousePos(1); "y" mousePos(2)]);
        end
    else
        disp("ERROR! Invalid Scene");
    end

    % increase frame counter for "not every frame" operations
    if (curFrame == 30)
        curFrame = 1;
    else
        curFrame = curFrame + 1;
    end

    % causes the game to run at the specified framerate
    % (more time management)
    pause (1/frameRate - toc);
end
