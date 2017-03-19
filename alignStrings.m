%
% This function takes two strings as input and returns an
% optimal string alignment table based on the following
% cost function:
%   indel = 1
%   swap = 10
%   sub = 10
%   no-op = 0
%

function S = alignStrings(x, y)
    
    % initialize S and fill in cost along edges
    S = zeros(length(x)+1, length(y)+1);
    for i = 2:length(x)+1
        S(i,1) = i - 1;
    end
    for j = 2:length(y)+1
        S(1,j) = j - 1;
    end
    
    % iterate throught the rest of the table and fill in the optimum
    % cost solutions
    for i = 2:length(x)+1
        for j = 2:length(y)+1
            indelAbove = S(i-1,j) + 1;  % cost of indel from above
            indelLeft = S(i,j-1) + 1;   % cost of indel from the left
            sub = S(i-1,j-1) + 10;      % cost of sub
            noop = S(i-1,j-1);
            if (x(i-1) ~= y(j-1))
                noop = Inf;             % if letters don't match no-op is not possible
            end
            swap = Inf;
            if (i>2 && j>2) 
                swap = S(i-2,j-2) + 10;      % cost of swap and possible subs
                if (x(i-2) ~= y(j-1))
                    swap = swap + 10;
                end
                if (x(i-1) ~= y(j-2))
                    swap = swap + 10;
                end
            end
            % place minimum cost in current table location
            S(i,j) = min([indelAbove, indelLeft, sub, swap, noop]);
        end
    end

end