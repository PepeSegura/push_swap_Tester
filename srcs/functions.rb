# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    functions.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 12:20:27 by psegura-          #+#    #+#              #
#    Updated: 2023/04/18 00:53:46 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def norminette()
	norminette = `norminette ../ | grep Error | wc -l | tr -d ' ' | tr -d '\n'`
	if norminette.to_i == 0
		puts "\033[1;42mNORMINETTE OK\033[0m"
	else
		puts "\033[1;41mNORMINETTE KO\033[0m"
	end
end

def check_moves(x, moves_count, checker_output)
	result = case x
	when 1
		moves_count.to_i == 0 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 2
		moves_count.to_i <= 3 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 3
		moves_count.to_i < 3 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 5
		moves_count.to_i <= 12 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 100
		case moves_count.to_i
		when 0...700 then "\t5 Points!"
		when 700...900 then "\t4 Points!"
		when 900...1100 then "\t3 Points!"
		when 1100...1300 then "\t2 Points!"
		when 1300...1500 then "\t1 Points!"
		else "\tKO"
		end
	when 500
		case moves_count.to_i
		when 0...5500 then "\t5 Points!"
		when 5500...7000 then "\t4 Points!"
		when 7000...8500 then "\t3 Points!"
		when 8500...10000 then "\t2 Points!"
		when 10000...11500 then "\t1 Points!"
		else "\tKO"
		end
	else "\tKO"
	end
	if result == "\tKO"
		puts "\033[1;31m#{result}\033[0m"
	else
		puts "\033[1;32m#{result}\033[0m"
	end
  end

def set_size(x)
	if x == 1
		return 1
	elsif x == 2
		return 2
	elsif x == 3
		return 10
	elsif x == 5
		return 20
	elsif x == 100 || x == 500
		return 50
	else
		return 10
	end
end

def check_system()
	system_type = `uname -s`
	if (system_type == "Linux\n")
		return ("Linux")
	elsif (system_type == "Darwin\n")
		return ("Mac")
	end
end