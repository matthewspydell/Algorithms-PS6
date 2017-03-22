function substrings = commonSubstrings(x, L, a)
  substrings = [];
  temp = [];
  indicator = 0;
  L_count = 0;
  
  %Index through a
  for i = 1:length(a)
      if (a(i) == 'i')
          if (i == 1)
             x = ['_' x]; 
          else
             x = [x(1:i-1) '_' x(i:length(x))];
          end
      else
        if (a(i) == '|')
            L_count = L_count + 1;
            temp = [temp x(i)];
            if (L_count >= L) %Add common substring to returning array
                indicator = 1;
                if (i == length(a))
                   substrings = [substrings ' ' temp]; 
                end
            end
      else
          if (indicator)
             substrings = [substrings ' ' temp]; 
          end
          indicator = 0;
          L_count = 0;
          temp = [];
      end
  end
  
end
