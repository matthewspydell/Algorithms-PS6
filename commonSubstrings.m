%
% this function finds all common substrings of 'x' and 'y'
% using the optimal operations in 'a' and the string 'x' all substrings of
% length L or greater are found

function substrings = commonSubstrings(x, L, a)
  substrings = char([]);
  temp = char([]);
  indicator = false;
  L_count = 0;
  j = 1;
  i = 1;
  k = 1;
  
  % while the index of the string is equal to one iterate through the
  % operations in a. This ensures that the blanks that are inserted before
  % each string do not have an affect on the commonString function
  while (i == 1)
    if (a(k) == 'i' || a(k) == '|' || a(k) == 's')
        i = i+1;    % if operation moves path one row down exit
    elseif (a(k) == 't')
        i = i+1;    % if operation moves path two rows down increment starting string index by one and exit
        j = j+1;
    end
    k = k+1;    % move to next operation in a
  end
  
  %Index through a starting at first valid operation
  for i = k:length(a)
      fprintf('i = %d    j = %d\n', i, j);
      
      if (a(i) == '|')  % if noop, add letter to temp substring and move index of string ahead by one
        L_count = L_count + 1;  % increment the length of the current substring
        temp = [temp, x(j)];  % concatenate the letter of x that corresponds to the no-op onto the current substring
        if (L_count == L)   % if the substring is at least as long as L, set indicator
           indicator = true;   % so that once a non noop operation is hit temp substring is added to substrings
        end
        j = j+1;    % move to next letter
        
      elseif (a(i) == 'd')   % if indel from left do not move to next index in string
        if (indicator) % if there was a substring at least as long as L
           substrings = [substrings, ', ', temp]; % add previously found common substring to returning array
           indicator = false;
        end 
        L_count = 0; 
        temp = []; % reset the substring holder
          
      elseif (a(i) == 't') % if swap move index of string ahead by two
        if (indicator) % if there was a substring at least as long as L
           substrings = [substrings, ' ', temp]; % add previously found common substring to returning array
           indicator = false;
        end   
        L_count = 0; 
        temp = []; % reset the substring holder
        j = j+2;    % move to the next second letter
          
      else  % if sub move index of string ahead by one
        if (indicator) % if there was a substring at least as long as L
           substrings = [substrings, ' ', temp]; % add previously found common substring to returning array
           indicator = false;
        end    
        L_count = 0; 
        temp = []; % reset the substring holder
        j = j+1;    % move to next letter
      end
  end
  
  if (indicator) % if last operation of string was a noop check if substring needs to be added
           substrings = [substrings, ' ', temp]; % add previously found common substring to returning array
  end
  
end
