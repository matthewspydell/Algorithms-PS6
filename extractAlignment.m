% This function takes a optimal cost string alignment table S,
% and the two strings, x and y, the table corresponds to and
% returns a sequence of operations that turn x into y
%

function a = extractAlignment(S,x,y) % S is an optimal cost matrix from alignStrings
    a = []; % empty vector of edit operations
    i = length(x); % initialize the search for a path to S[0,0]
    j = length(y);
    
    while (i>0 || j>0)
        a[i] = determineOptimalOp(S,i,j) % what was the optimal choice here?
        [i,j] = updateIndices(S,i,j,a) % move to next position
    end
    
    return a
end
