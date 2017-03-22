function substrings = commonSubstrings(x, L, a)
  substrings = [];
  temp = [];
  indicator = 0;
  L_count = 0;
  
  %Index through a
  for i = 1:length(a)
      if (a(i) == 'i') %Add in spaces to x if an insertion operation took place
          if (i == 1)
             x = ['_' x]; 
          else
             x = [x(1:i-1) '_' x(i:length(x))];
          end
      else
        if (a(i) == '|') %If there is a no-op character:
            L_count = L_count + 1; %Increment no-op counter
            temp = [temp x(i)]; %Add the corresponding character to a temp storage
            if (L_count >= L) %Add common substring to returning array
                indicator = 1; %To indicate that a sufficiently long substring has been found.
                if (i == length(a)) %If a substring is found at the end of the array
                   substrings = [substrings ' ' temp]; 
                end
            end
      else
          if (indicator) %If substring of length at least L has been found
             substrings = [substrings ' ' temp]; %Add the substring to the returning array
          end
          indicator = 0; %Reset variables and temporary substring holder
          L_count = 0;
          temp = [];
      end
  end
  
end
