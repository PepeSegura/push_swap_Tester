# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_parser.rb                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 10:28:02 by psegura-          #+#    #+#              #
#    Updated: 2023/04/11 13:01:11 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def test_parser(var)
	system("../push_swap " + var + " >.moves" + " 2>/dev/null")
	
	moves_count = `cat .moves | wc -l | tr -d ' ' | tr '\n' '\t'`
	# printf "moves_count %s\n", moves_count
	
	checker_output = `cat .moves | ./checker #{var} 2>/dev/null | wc -l | tr -d ' ' | tr -d '\n' `
	#  printf "checker_output %s\n", checker_output
	
	# Print Input:
	# 	Shows the input used in the tester.
	printf "[%-25s]", var
	
	# Print Checker:
	# 	OK if the input is valid.
	# 	KO if there is a bad input.
	if checker_output.to_i == 1
		print "\033[1;32m%10s\033[0m" % "OK"
	else
	  print "\033[1;31m%10s\033[0m" % "KO"
	end
	
	# Print Result: 
	# 	OK if the tester and your program give an error.
	# 	OK if the tester and your program give an OK.
	# 	KO if the tester and your program don't say the same.
	if moves_count.to_i == 0 && checker_output.to_i == 0
		print "\033[1;32m%10s\n\033[0m" % "OK"
	elsif moves_count.to_i >= 0 && checker_output.to_i == 1
		print "\033[1;32m%10s\n\033[0m" % "OK"
	else
		print "\033[1;31m%10s\n\033[0m" % "KO"
	end
end

def	tester_parser
	
	puts "\033[0;36m%-30s%10s%10s\033[0m" % ["Input", "Checker", "Result"]
	
	# Test Invalid Chars
	puts "\033[0;35mInvalid Characters\033[0m"
	var = "1 2a 3"
	test_parser(var)
	var = "a 1 2 3"
	test_parser(var)
	var = "1 2 3 a"
	test_parser(var)
	var = "- 1 2 3"
	test_parser(var)
	var = "+ 1 2 3"
	test_parser(var)
	
	# Test Number Limits
	puts "\033[0;35mOver INT_MAX/INT_MIN\033[0m"
	var = "2147483648 2 1"
	test_parser(var)
	var = "-2147483649 2 1"
	test_parser(var)
	puts "\033[0;35mOver LONG_MAX/LONG_MIN\033[0m"
	var = "+9223372036854775808 2 1"
	test_parser(var)
	var = "-9223372036854775809 2 1"
	test_parser(var)
	
	# Test Repeated Numbers
	puts "\033[0;35mRepeated Numbers\033[0m"
	var = "-1 -1 2"
	test_parser(var)
	var = "+1 1 2"
	test_parser(var)
end
