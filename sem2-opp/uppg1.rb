def get_diff(str, divider)
  str_int = str.split(divider)
  for i in 0...2
    str_int[i] = str_int[i].delete(" ")
    str_int[i] = str_int[i].delete("*")
    str_int[i] = Integer(str_int[i])
  end
  return str_int[0]-str_int[1]
end

def tabell(file_name, divider, reg0, reg1)
  file = File.open(file_name)
  file_str = file.read
  file.close

  s_results= file_str.scan(reg0)
  s_names= file_str.scan(reg1)


  for i in 0...s_results.length()
    s_results[i] = get_diff(s_results[i], divider)
  end
  
  s_all = []

  for i in 0...s_results.length()-1
    s_names[i] = s_names[i].delete("\n ")
    s_all[i] = [s_results[i], s_names[i]] 
  end

  s_all = s_all.sort { |a, b| b <=> a }

  return s_all
end

days = /[\n][" "]+[\d]+[" "]+/ #hitta bara dagar

temps = /[" "]{2}[\d]+[\*" "]{3,4}[\d]+[*" "]+/ #hitta bara mxt mnt

fball_res = /[\d]+[" "]+-[" "]+[\d]+/ #hitta resultat football

teams = /[\d]+\. [A-Z][\w]+/ #hitta lagnamn

table = tabell("football.txt", "-", fball_res, teams)

#p table[-1]

#p table

