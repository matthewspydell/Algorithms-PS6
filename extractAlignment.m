%
% This function takes a optimal cost string alignment table S,
% and the two strings, x and y, the table corresponds to and
% returns a sequence of operations that turn x into y
%

function a = extractAlignment(S,x,y)
    a = char([]);
    i = length(x)+1;
    j = length(y)+1;
    disp('Trace back coordinates')
    fprintf('i = %d    j = %d\n', i, j);
    
    % trace back path until the path hits the edge of the table
    while (i>1 && j>1)
        [a(end+1), i, j] = determineOptimalOp(S, i, j, x, y);
        fprintf('i = %d    j = %d\n', i, j);
    end
    disp('finished while loop')
    
    % if i and j are greater than one inser indels until path reaches
    % origin of the table
    if (i>1)
        for k = 1:i-1
            fprintf('i = %d    j = %d\n', i-k, j);
            a(end+1) = 'i';
        end
    end
    if (j>1)
        for k = 1:j-1
            fprintf('i = %d    j = %d\n', 0, j-k);
            a(end+1) = 'd';
        end
    end
    a = fliplr(a);
end