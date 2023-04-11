# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    functions.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 12:20:27 by psegura-          #+#    #+#              #
#    Updated: 2023/04/11 12:21:39 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def greet(name)
	puts "Hello, #{name}!"
end

def check_moves(x, moves_count)
	if x == 3 && moves_count.to_i < 3
		puts "\033[1;32m\tOK\033[0m"

	elsif x == 5 && moves_count.to_i <= 12
		puts "\033[1;32m\tOK\033[0m"

	elsif x == 100 && moves_count.to_i < 700
		puts "\033[1;32m\t5 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 900
		puts "\033[1;32m\t4 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 1100
		puts "\033[1;32m\t3 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 1300
		puts "\033[1;32m\t2 Points!\033[0m"
	elsif x == 100 && moves_count.to_i < 1500
		puts "\033[1;32m\t1 Points!\033[0m"

	elsif x == 500 && moves_count.to_i < 5500
		puts "\033[1;32m\t5 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 7000
		puts "\033[1;32m\t4 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 8500
		puts "\033[1;32m\t3 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 10000
		puts "\033[1;32m\t2 Points!\033[0m"
	elsif x == 500 && moves_count.to_i < 11500
		puts "\033[1;32m\t1 Points!\033[0m"

	else
		puts "\033[1;31m\tKO\033[0m"
	end
end
