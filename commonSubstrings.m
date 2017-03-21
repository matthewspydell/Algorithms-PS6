function substrings = commonSubstrings(x, L, a)
  substrings = [];
  temp = [];
  L_count = 0;
  
  %Increment through x and a
  for i = 1 to length(a)
      if (a(i) == '|')
        L_count = L_count + 1;
        temp = [temp x(i)];
        if (L_count >= L) %Add common substring to returning array
           substrings = [substrings; temp];
        end
      else
          L_count = 0;
          temp = [];
      end
  end
  
end
