%% buy.m
%% author: anna bontempo

%% function to buy a specified upgrade and change the "static" values
%MAY NOT WORK........
function [upgrades, bal, rate] = buy(baseCosts, numUpgrades, numCookies, orderNum, baseBoost, cookieRate)
    % set default return parameter values
    upgrades = numUpgrades;
    rate = cookieRate;
    % product base cost
    C = baseCosts(orderNum);
    % number of product already owneds
    n = numUpgrades(orderNum);
    % get current amount of cookies
    bal = numCookies;

    % calculate price
    price = floor(C * 1.15^(n-1));

    % make sure player can afford
    if (bal >= price)
        % deduct cost
        bal = bal - price;
        % add upgrade to player's data
        upgrades(orderNum) = n + 1;
        rate = cookieRate + baseBoost(orderNum);
    end
end