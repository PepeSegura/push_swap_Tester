# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    push_swap_tester.rb                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pepe <pepe@student.42.fr>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/10 22:09:53 by psegura-          #+#    #+#              #
#    Updated: 2023/04/17 11:18:17 by pepe             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require_relative 'functions.rb'
require_relative 'test_parser.rb'

# Check if system is Linux or Mac
system_type = check_system()

# Check for norminette
norminette()

# Check for parse errors
tester_parser()

# Main tester
# [3, 5, 100, 500, 2, 4, 35, 150, 542].each do |x|
[3, 5, 100, 500].each do |x|
	if x == 100 || x == 500
		puts "\033[0;36mInput size\tMoves\tChecker\tResult\033[0m"
	else
		puts "\033[0;36mInput\t\tMoves\tChecker\tResult\033[0m"
	end
	
	rep = set_size(x)

	rep.times do
		var = (1..x).to_a.shuffle.join(' ')
		if x == 3 || x == 2
	  		printf "[%s]\t\t", var
		elsif x == 35 || x == 100 || x ==  150 || x == 500 || x == 542
			printf "%d\t\t", x
		else
			printf "[%s]\t", var
		end

		system("../push_swap " + var + " >.moves")

		moves_count = `cat .moves | wc -l | tr -d ' ' | tr '\n' '\t'`
		print moves_count

		checker_output = `cat .moves | ./srcs/checker_#{system_type} #{var} | tr -d '\n'`
		system("rm -f .moves")

		if checker_output == "OK"
			print "\033[1;32mOK\033[0m"
		else
			print "\033[1;31mKO\033[0m"
		end

		check_moves(x, moves_count, checker_output)
	end
end
