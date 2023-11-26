%% leaderboardhandler.m
%% author: anna bontempo

%% gets the leaderboard for the specified game
function leaderboard = leaderboardhandler(game, varargin)
    clc
    game = "cookieclicker";
    % api url goes here, use localhost for api testing
    url = "http://localhost:3000/db";
    
    % specify text as response format (api uses json, but matlab needs text)
    options = weboptions("ContentType", "text");
    
    % perform get request, parse to string and print out the data
    response = jsondecode(webread(url, options));

    switch game
        case "cookieclicker"
            data = response.cookieclicker;
        case "papaspizzeria"
            data = response.papaspizzeria;
        case "dungeoncrawler"
            data = response.dungeoncrawler;
        case "tictactoe"
            data = response.tictactoe;
        otherwise
            disp("leaderboardhandler.m: ERROR! invalid game specified.")
            return;
    end

    for i = 1:length(data)
        playerData = data(i);
        leaderboard{i, 1} = string(playerData.name);
        leaderboard{i, 2} = playerData.score;
    end
end