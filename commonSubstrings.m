function substrings = commonSubstrings(x, L, a)
  substrings = [];
  temp = [];
  indicator = 0;
  L_count = 0;
  
  %Increment through x and a
  for i = 1:length(a)
      if (a(i) == '|')
        L_count = L_count + 1;
        temp = [temp x(i)];
        if (L_count >= L) %Add common substring to returning array
           indicator = 1;
        end
      else
          if (indicator)
             substrings = [substrings ' ' temp]; 
          end
          L_count = 0;
          temp = [];
      end
  end
  
end
