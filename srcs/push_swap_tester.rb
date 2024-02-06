# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    push_swap_tester.rb                                :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/10 22:09:53 by psegura-          #+#    #+#              #
#    Updated: 2024/02/06 21:40:52 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

require_relative 'functions.rb'

def main_tester(system_type)
	file_path = '.results'
	File.open(file_path, 'w') do |file|
		[1, 2, 3, 4, 5, 100, 500].each do |x|
			if x == 100 || x == 500
				puts "\033[0;36mInput size\tMoves\tChecker\tResult\033[0m"
			else
				puts "\033[0;36mInput\t\tMoves\tChecker\tResult\033[0m"
			end
		
			rep = set_size(x)
			if x < 100
				all_combinations(x).each do |combination|
				  var = combination.join(' ')
				  if x < 4
				  	printf "[%s]\t\t", var
				  else
					printf "[%s]\t", var	
				  end
				  system("$(../push_swap " + var + " >.moves) > /dev/null 2>&1; echo $? > .exit_status")
				  exit_status = `cat .exit_status | tr -d ' ' | tr -d '\n'`
		
				  moves_count = `cat .moves | wc -l | tr -d ' ' | tr '\n' '\t'`
				  print moves_count
				  file.puts "#{x} - #{moves_count}"
		
				  checker_output = `cat .moves | ./srcs/checker_#{system_type} #{var} | tr -d '\n'`
				  system("rm -f .moves")

				  if checker_output == "OK"
					print "\033[1;32mOK\033[0m"
				  else
					print "\033[1;31mKO\033[0m"
				  end
				  check_moves(x, moves_count, checker_output, exit_status)
				end
			else
				first_iteration = true
				
				rep.times do
					if first_iteration
						var = generate_sequence(x).join(' ')
						first_iteration = false
					else
						var = generate_random_sequence(x).join(' ')
					end
	
					if x == 1 || x == 2 || x == 3 || x == 4 || x == 5
						printf "[%s]\t\t", var
					elsif x == 100 || x == 500
						printf "%d\t\t", x
					else
						printf "[%s]\t", var
					end
				
					system("$(../push_swap " + var + " >.moves) > /dev/null 2>&1; echo $? > .exit_status")

				  	exit_status = `cat .exit_status | tr -d ' ' | tr -d '\n'`
					moves_count = `cat .moves | wc -l | tr -d ' ' | tr '\n' '\t'`
					print moves_count
					if exit_status.to_i == 139
						moves_count = "Segmentation Fault"
					end 
					file.puts "#{x} - #{moves_count}" 
				
					checker_output = `cat .moves | ./srcs/checker_#{system_type} #{var} | tr -d '\n'`
					system("rm -f .moves")
				
					if checker_output == "OK"
						print "\033[1;32mOK\033[0m"
					else
						print "\033[1;31mKO\033[0m"
					end
					check_moves(x, moves_count, checker_output, exit_status)
				end
			end
		end
	end
end
