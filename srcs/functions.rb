# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    functions.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pepe <pepe@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 12:20:27 by psegura-          #+#    #+#              #
#    Updated: 2023/04/17 11:11:54 by pepe             ###   ########.fr        #
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
	if x == 3 && moves_count.to_i < 3 && checker_output == "OK"
		puts "\033[1;32m\tOK\033[0m"

	elsif x == 5 && moves_count.to_i <= 12 && checker_output == "OK"
		puts "\033[1;32m\tOK\033[0m"

	elsif x == 100 && moves_count.to_i < 700 && checker_output == "OK"
		puts "\033[1;32m\t5 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 900 && checker_output == "OK"
		puts "\033[1;32m\t4 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 1100 && checker_output == "OK"
		puts "\033[1;32m\t3 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 1300 && checker_output == "OK"
		puts "\033[1;32m\t2 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 1500 && checker_output == "OK"
		puts "\033[1;32m\t1 Points!\033[0m"

	elsif x == 500 && moves_count.to_i < 5500 && checker_output == "OK"
		puts "\033[1;32m\t5 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 7000 && checker_output == "OK"
		puts "\033[1;32m\t4 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 8500 && checker_output == "OK"
		puts "\033[1;32m\t3 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 10000 && checker_output == "OK"
		puts "\033[1;32m\t2 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 11500 && checker_output == "OK"
		puts "\033[1;32m\t1 Points!\033[0m"

	else
		puts "\033[1;31m\tKO\033[0m"
	end
end

def set_size(x)
	if x == 3
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
	else
		return ("Mac")
	end
end