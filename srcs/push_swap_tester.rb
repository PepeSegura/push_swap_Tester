# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    push_swap_tester.rb                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/10 22:09:53 by psegura-          #+#    #+#              #
#    Updated: 2023/10/26 21:27:12 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require_relative 'functions.rb'

# Main tester
# [3, 5, 100, 500, 2, 4, 35, 150, 542].each do |x|
def main_tester(system_type)
	[1, 2, 3, 5, 100, 500].each do |x|
		if x == 100 || x == 500
			puts "\033[0;36mInput size\tMoves\tChecker\tResult\033[0m"
		else
			puts "\033[0;36mInput\t\tMoves\tChecker\tResult\033[0m"
		end

		rep = set_size(x)

		rep.times do
			var = (1..x).to_a.shuffle.join(' ')
			if x == 3 || x == 2 || x == 1
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
end

def tester_fsusanna(system_type)
	[1, 2, 3, 5, 100, 500, 50, 250, 750, 1000].each do |x|

		puts "\033[0;36mInput size\tMoves\tChecker\tResult\033[0m"

		1.times do
			var = `./srcs/nbr_generator #{x}`

			printf "%d\t\t", x

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
end
