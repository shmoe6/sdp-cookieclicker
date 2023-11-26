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
engine = simpleGameEngine("CookieClicker.png", 84, 84, 5, [173 216 230]);

% store fps to be used by while loop
frameRate = 30;

% create struct of game data to avoid cluttering other classes
data = initializeData(struct());
disp(data);

% start on the main menu
toMainMenu(engine, data);

% avoid mouse problems
oldMousePos = [0, 0];
global mousePos;

%% game manager code
% this while loop checks to see the current scene and handles events 
% according to this current scene 
while true
    % time management
    tic

    % set up event handling
    engine.my_figure.KeyPressFcn = @(src, event)guidata(src, event.Key);
    engine.my_figure.KeyReleaseFcn = @(src, event)guidata(src, '0');
    key_down = guidata(engine.my_figure);
    engine.my_figure.WindowButtonDownFcn = @(src, event)clickHandler(src);
    %disp(getappdata(gcf, 'mousePos'));
    %% main menu control
    if (data.currentScreen == "Main Menu")
        % prompt user for input, following the direction on screen
        disp("MAIN MENU!");
        getKeyboardInput(engine);

        % after keyboard input received, start game
        data.currentScreen = "Game Scene";
        toGameScene(engine, data);
    %% game scene control
    elseif (data.currentScreen == "Game Scene")
        % if key_down ~= '0'
        %     disp('pressed');
        % end

        % handle mouse click only if the mouse has changed positions
        if (oldMousePos ~= mousePos)
            disp("x = " + mousePos(1) + " y = " + mousePos(2));
            oldMousePos = mousePos;

            % handle click of the shop button per coordinates below:
            %(x     y   )
            %(3000, 3500)
            %(3500, 3700)
            if (mousePos(1) >= 3000 && mousePos(1) <= 3500 ...
             && mousePos(2) >= 3500 && mousePos(2) <= 3700)
                data.currentScreen = "Shop Scene";
                toShopScene(engine, data);
            end
        end
    %% shop scene control
    elseif (data.currentScreen == "Shop Scene")
        % handle mouse click only if the mouse has changed positions
        if (oldMousePos ~= mousePos)
            disp("x = " + mousePos(1) + " y = " + mousePos(2));
            oldMousePos = mousePos;

            % handle click of a buy button per coordinates below:
            %(x     y )
            %(3300, y1)
            %(3700, y2)
            if (mousePos(1) >= 3300 && mousePos(1) <= 3700)
                yCoord = mousePos(2);

                % check y coordinates to see if a button was clicked
                
                % buy cursor: 500 <= y <= 700
                if (isInRange(yCoord, 500, 700))
                    disp("cursor buy button");
                    buy(data, 1);
                    
                % buy powerclick: 500 <= y <= 700
                elseif (isInRange(yCoord, 950, 1150))
                    disp("powerclick buy button");
                    buy(data, 2);

                % buy chef: 1400 <= y <= 1600
                elseif (isInRange(yCoord, 1400, 1600))
                    disp("chef buy button");
                    buy(data, 3);

                % buy tree: 1800 <= y <= 2000
                elseif (isInRange(yCoord, 1800, 2000))
                    disp("tree buy button");
                    buy(data, 4);

                % buy mine: 2250 <= y <= 2450
                elseif (isInRange(yCoord, 2250, 2450))
                    disp("mine buy button");
                    buy(data, 5);
                
                % buy factory: 2700 <= y <= 2900
                elseif (isInRange(yCoord, 2700, 2900))
                    disp("factory buy button");
                    buy(data, 6);

                % buy research: 3100 <= y <= 3300
                elseif (isInRange(yCoord, 3100, 3300))
                    disp("research buy button");
                    buy(data, 7);

                % buy monopoly: 3550 <= y <= 3750
                elseif (isInRange(yCoord, 3550, 3750))
                    disp("monopoly buy button");
                    buy(data, 8);
                end
            end
            % used for debugging, can be deleted
            disp(["x" mousePos(1); "y" mousePos(2)]);
        end
    else
        disp("ERROR! Invalid Scene");
    end

    % causes the game to run at the specified framerate
    % (more time management)
    
    pause (1/frameRate - toc);
end