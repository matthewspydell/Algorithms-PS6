% this function determines the optimal string alignment decisions to
% transform x into y. Tie-breaking is done randomly so multiple runs of
% this algorithm will find every possible combination of optimal string
% alignment decisions
% cost function:
%   indel = 1
%   swap = 10
%   sub = 10
%   no-op = 0
%

function [op, i, j] = determineOptimalOp(S, i, j, x, y)
    % total cost at current position
    total = S(i,j);
    swapCost = 0;
    choice = [];
    
    % check if indel from above was an optimal choice
    if (total == S(i-1,j) + 1)
        choice(end+1) = 1;
    end
    
    % check if indel from left was an optimal choice
    if (total == S(i,j-1) + 1)
        choice(end+1) = 2;
    end
    
    % check if no-op was an optimal choice
    if (total == S(i-1,j-1) && x(i-1) == y(j-1))
        choice(end+1) = 3;
    end
    
    % check if sub was an optimal choice
    if (total == S(i-1,j-1) + 10 && x(i-1) ~= y(j-1))
        choice(end+1) = 4;
    end
    
    % check if swap was an optimal choice
    if (i>2 && j>2)
        if (x(i-2) ~= y(j-1))
            swapCost = 10;
        end
        if (x(i-1) ~= y(j-2))
            swapCost = swapCost + 10;
        end
        if (total == S(i-2,j-2) + swapCost)
            choice(end+1) = 5;
        end
    end
    
    % choose one of the optimal choices randomly
    randomChoice = choice(randi(length(choice)));
    
    switch randomChoice
        case 1
            op = 'i';
            i = i-1;
            j = j;
        case 2
            op = 'd';
            i = i;
            j = j-1;
        case 3
            op = '|';
            i = i-1;
            j = j-1;
        case 4
            op = 't';
            i = i-1;
            j = j-1;
        case 5
            op = 's';
            i = i-2;
            j = j-2;
        otherwise
            op = 'e';
    end    
end