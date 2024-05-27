clc
clear all 

disp('Use arrow keys to move the object. Press Q to quit.');

b0 = [0 0];
i = 0;
while true
            
    if mod(i, 8) == 1
        [b, ll, lr] = State2(b0);
    elseif mod(i, 8) == 5
        [b, ll, lr] = State3(b0);
    elseif (mod(i, 8) == 2) || (mod(i, 8) == 0)
        [b1, ll1, lr1] = State2(b0);
        [b2, ll2, lr2] = State1(b0);
        b = (b1 + b2) / 2;
        ll = (ll1 + ll2) / 2;
        lr = (lr1 + lr2) / 2;
    elseif (mod(i, 8) == 4) || (mod(i, 8) == 6)
        [b1, ll1, lr1] = State3(b0);
        [b2, ll2, lr2] = State1(b0);
        b = (b1 + b2) / 2;
        ll = (ll1 + ll2) / 2;
        lr = (lr1 + lr2) / 2;
    else  
        [b, ll, lr] = State1(b0);
    end
        
    plotLizard(b, ll, lr, i);

    waitforbuttonpress;
    clf
    key = get(gcf, 'CurrentCharacter');
    
    switch key
        case char(30) % Up arrow
            b0 = [b0(1) b0(2)-0.3];
        case char(31) % Down arrow
            b0 = [b0(1) b0(2)+0.3];
        case char(28) % Left arrow
            b0 = [b0(1)+0.3 b0(2)];
        case char(29) % Right arrow
            b0 = [b0(1)-0.3 b0(2)];
        case 'q'
          break;
    end
    i = i + 1;
    
end   



function [ b, ll, lr] = State1(b0)
    
    b1 = [-1.5 0];
    b2 = [-0.5 0];
    b3 = [0.5 0];
    b4 = [1.5 0];
    
    b = [b1; b2; b3; b4] - b0;
    
    l1 = [-0.5 0.5];
    l2 = [-0.5 -0.5];

    ll = [l1; l2] - b0;

    l3 = [0.5 0.5];
    l4 = [0.5 -0.5];
    
    lr = [l3; l4] - b0;
end


function [ b, ll, lr] = State2(b0)
    
    b1 = [(-0.5 - sqrt(3)/2) (-0.5)]; % Body Moved by 30 degrees
    b2 = [-0.5 0];
    b3 = [0.5 0];
    b4 = [(0.5 + sqrt(3)/2) (0.5)];
    
    b = [b1-b0; b2-b0; b3-b0; b4-b0];
    
    l1 = [(-0.5-0.5/(2)) (0.5*sqrt(3)/2)]; % Legs Moved by 30 degrees
    l2 = [(-0.5+0.5/(2)) (-0.5*sqrt(3)/2)];

    ll = [l1; l2] - b0;

    l3 = [(0.5+0.5/(2)) (0.5*sqrt(3)/2)];
    l4 = [(0.5-0.5/(2)) (-0.5*sqrt(3)/2)];
    
    lr = [l3; l4] - b0;

end


function [ b, ll, lr] = State3(b0)
    
    b1 = [(-0.5 - sqrt(3)/2) (0.5)];
    b2 = [-0.5 0];
    b3 = [0.5 0];
    b4 = [(0.5 + sqrt(3)/2) (-0.5)];
    
    b = [b1; b2; b3; b4] - b0;
    
    l1 = [(-0.5+0.5/(2)) (0.5*sqrt(3)/2)];
    l2 = [(-0.5-0.5/(2)) (-0.5*sqrt(3)/2)];

    ll = [l1; l2] - b0;

    l3 = [(0.5-0.5/2) (0.5*sqrt(3)/2)];
    l4 = [(0.5+0.5/2) (-0.5*sqrt(3)/2)];
    
    lr = [l3; l4] - b0;
end

function plotLizard(b, ll, lr, f)

    if mod(f,5) == 1
        l = 'red';
        g = 'green';
    elseif mod(f,5) == 2
        l = 'green';
        g = 'blue';
    elseif mod(f,5) == 3
        l = 'blue';
        g = 'yellow';
    elseif mod(f,5) == 4
        l = 'yellow';
        g = 'cyan';
    else
        l = 'cyan';
        g = 'red';
    end
    % Plot all points together
    hold on;
    plot(b(:,1), b(:,2), 'Color', l , 'LineWidth', 2);

    % Plot left leg
    plot(ll(:,1), ll(:,2), 'Color', g, 'LineWidth', 2);

    % Plot right leg
    plot(lr(:,1), lr(:,2), 'Color', g, 'LineWidth', 2);

    axis equal;
    xlim([-4 4]);    
    ylim([-4 4]);

    
end



