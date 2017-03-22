function substrings = commonSubstrings(x, L, a)
  substrings = [];
  temp = [];
  indicator = 0;
  L_count = 0;
  
  %Index through a, looking for a no-op character
  for i = 1:length(a)
      if (a(i) == '|')
        L_count = L_count + 1; %Increment the count of no-ops
        temp = [temp x(i)]; %Concatenate the letter of x that corresponds to the no-op found
        if (L_count >= L) %If the substring is at least as long as L, set indicator
           indicator = 1;
        end
      else
          if (indicator) %If there was a substring at least as long as L
             substrings = [substrings ' ' temp]; %Add previously found common substring to returning array
          end
          L_count = 0; 
          temp = []; %Reset the substring holder
      end
  end
  
end
