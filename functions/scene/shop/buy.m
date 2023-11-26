%% buy.m
%% author: anna bontempo

%% function to buy a specified upgrade and change the "static" values
%MAY NOT WORK........
function buy(data, orderNum)
    % product base cost
    C = data.baseCosts(orderNum);
    % number of product already owned
    n = data.numUpgrades(orderNum);
    % get current amount of cookies
    bal = data.numCookies;

    % calculate price
    price = floor(C * 1.15^(n-1));

    % adjust values accordingly
    data.numCookies = bal - price;
    data.numUpgrades(orderNum) = n;

    disp("ENDOFMETHOD");
end