# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    push_swap_tester.rb                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/10 22:09:53 by psegura-          #+#    #+#              #
#    Updated: 2023/04/11 13:32:51 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require_relative 'functions.rb'
require_relative 'test_parser.rb'

# Check for norminette
norminette()

# Check for parse errors
tester_parser()

# Main tester
[3, 5, 100, 500].each do |x|
	if x == 100 || x == 500
		puts "\033[0;36mInput size\tMoves\tChecker\tResult\033[0m"
	else
		puts "\033[0;36mInput\t\tMoves\tChecker\tResult\033[0m"
	end
	
	if x == 3
		rep = 10
	elsif x == 5
		rep = 20
	else
		rep = 50
	end

	rep.times do
		var = (1..x).to_a.shuffle.join(' ')
		if x == 3
	  		printf "[%s]\t\t", var
		elsif x == 100 || x == 500
			printf "%d\t\t", x
		else
			printf "[%s]\t", var
		end

		system("../push_swap " + var + " >.moves")

		moves_count = `cat .moves | wc -l | tr -d ' ' | tr '\n' '\t'`
		print moves_count

		checker_output = `cat .moves | ./srcs/checker #{var} | tr -d '\n'`
		if checker_output == "OK"
			print "\033[1;32mOK\033[0m"
		else
			print "\033[1;31mKO\033[0m"
		end
		check_moves(x, moves_count)
		system("rm -f .moves")
	end
end
