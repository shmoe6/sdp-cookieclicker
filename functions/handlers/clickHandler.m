%% clickHandler.m
%% author: anna bontempo

%% callback function to handle mouse clicks
function clickHandler(src, ~)
    pt = get(gca,'CurrentPoint');
    %fprintf('Clicked: %d %d\n', pt(1,1),pt(1,2));

    % store in global variable for access
    global mousePos;
    mousePos = [pt(1, 1) pt(1, 2)];
end