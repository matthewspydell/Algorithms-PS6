%
% This function takes a optimal cost string alignment table S,
% and the two strings, x and y, the table corresponds to and
% returns a sequence of operations that turn x into y
%

function a = extractAlignment(S,x,y)
    a = [];
    i = length(x)+1;
    j = length(y)+1;
    
    while (i>0 || j>0)
        a[i] = determineOptimalOp(S, i, j, x, y);
        [i, j] = updateIndices(S, i, j, a);
    end
end
