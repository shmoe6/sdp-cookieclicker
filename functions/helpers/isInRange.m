%% isInRange.m
%% author: anna bontempo

% while this function isnt entirely necessary it helps with code 
% readability and creates some compartmentalization :D
%% checks if n is in the lower and upper bounds (inclusive)
function result = isInRange(n, lower, upper)
    result = n >= lower && n <= upper;
end