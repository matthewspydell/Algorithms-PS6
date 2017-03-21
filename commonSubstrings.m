%
% this function finds all common substrings of 'x' and 'y'
% using the optimal operations in 'a' and the string 'x' all substrings of
% length L or greater are found

function substrings = commonSubstrings(x, L, a)

    substrings = char(zeros(length(x)));
    index = char([]);
    
    for i = 1:length(x)
        if (a(i) == '|')
            count = count +1;
            index(end+1) = x(i-1);
            if count >= L
                for j = 1:length(index)
                    
                end
            end
        else
            count = 0;
            index = [];
        end

    end

end
