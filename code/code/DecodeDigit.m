function [num] = DecodeDigit(w)
%----------------------------------------------
%w=vector of tone frequencies 
%num= digit corresponding to tone frequencies
%takes tone frequencies w as input and returns corresponding digit 
%---------------------------------------------
  row = [697 770 852 941];
  column = [1209 1336 1477];
  row_index = 0;
  column_index = 0;
  num='E';
  for k = 1:4
    if row(k) == w(1) || row(k) == w(2)
      row_index = k;
      break;
    end
  end
  for k = 1:3
    if column(k) == w(1) || column(k) == w(2)
      column_index = k;
    break;
    end
  end
  
  if row_index == 1
    if column_index == 1
      num = '1';
    elseif column_index == 2
      num = '2';
    elseif column_index == 3
      num = '3';
    end
  end
  
  if row_index == 2
    if column_index == 1
      num = '4';
    elseif column_index == 2
      num = '5';
    elseif column_index == 3
      num = '6';
    end
  end
  
  if row_index == 3
    if column_index == 1
      num = '7';
    elseif column_index == 2
      num = '8';
    elseif column_index == 3
      num = '9';
    end
  end
  
  if row_index == 4
    if column_index == 1
      num = '*';
    elseif column_index == 2
      num = '0';
    elseif column_index == 3
      num = '#';
    end
  end
  
  
  if num=='E'
  disp("Error frequency combination not found");
  end
  
  
  end