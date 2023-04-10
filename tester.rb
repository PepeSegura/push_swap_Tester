# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    tester.rb                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/10 22:09:53 by psegura-          #+#    #+#              #
#    Updated: 2023/04/11 00:17:42 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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

		checker_output = `cat .moves | ./checker #{var} | tr -d '\n'`
		if checker_output == "OK"
			print "\033[1;32mOK\033[0m"
		else
			print "\033[1;31mKO\033[0m"
		end
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
		system("rm -f .moves")
	end
end
