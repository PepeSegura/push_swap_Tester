# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test_parser.rb                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: psegura- <psegura-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 10:28:02 by psegura-          #+#    #+#              #
#    Updated: 2024/02/06 21:40:52 by psegura-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

def test_empty(system_type)
	system("$(../push_swap >.moves 2>.error) > /dev/null 2>&1; echo $? > .exit_status")
	exit_code = `cat .exit_status | tr -d ' ' | tr -d '\n'`
	# printf "exit_status: %s\n", exit_code
	
	moves_count = `cat .moves | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "moves_count %s\n", moves_count.to_i
	error_count = `cat .error | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "error_count %s\n", error_count.to_i
	
	checker_output = `cat .moves | ./srcs/checker_#{system_type} 2>/dev/null | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "checker_output %s\n", checker_output.to_i
	
	printf "[%-25s]", ""

	if exit_code.to_i == 139
		print "\033[1;31m%10s\n\033[0m" % " \tSegmentation fault 💀"
	elsif moves_count.to_i == 0 && error_count.to_i == 0 && checker_output.to_i == 0
		print "\033[1;32m%10s\n\033[0m" % "OK"
	else
		print "\033[1;31m%10s\n\033[0m" % " \tYou don't have to print anything"
	end
	system("rm -f .error .moves .exit_status")
end

def test_parser(var, system_type)
	system("$(../push_swap " + var + " >.moves 2>.error) > /dev/null 2>&1; echo $? > .exit_status")
	exit_code = `cat .exit_status | tr -d ' ' | tr -d '\n'`
	# printf "exit_status: [%s]\n", exit_code
	moves_count = `cat .moves | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "moves_count [%s]\n", moves_count
	error_count = `cat .error | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "error_count [%s]\n", error_count
	
	system("cat .moves | ./srcs/checker_#{system_type} #{var} > .checker_out 2> .checker_err")

	checker_out = `cat .checker_out | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "checker_out [%s]\n", checker_out
	checker_err = `cat .checker_err | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "checker_err [%s]\n", checker_err
	
	# Print Input:
	# 	Shows the input used in the tester.
	printf "[%-25s]", var

	# Print Result: 
	# 	OK if the tester and your program give an error.
	# 	OK if the tester and your program give an OK.
	# 	KO if the tester and your program don't say the same.
	if exit_code.to_i == 139
		print "\033[1;31m%10s\n\033[0m" % " \tSegmentation fault 💀"
	elsif moves_count.to_i == 0 && error_count.to_i != 0 && checker_err.to_i == 1
		print "\033[1;32m%10s\n\033[0m" % "OK"
	elsif moves_count.to_i > 0 && error_count.to_i == 0 && checker_err.to_i == 1
		print "\033[1;31m%10s\n\033[0m" % " \tNot in STDERR"
	elsif moves_count.to_i >= 0 && checker_out.to_i == 1
		print "\033[1;32m%10s\n\033[0m" % "OK"
	end
	system("rm -f .error .moves .exit_status .checker_out .checker_err")
end

def	tester_parser(system_type)
	
	puts "\033[0;36m%-30s%10s\033[0m" % ["Input", "Result"]
	
	# Test No input
	puts "\033[0;35mNo Input\033[0m"
	test_empty(system_type)

	# Test Invalid Chars
	puts "\033[0;35mInvalid Characters\033[0m"
	var = "1 2a 3"
	test_parser(var, system_type)
	var = "a 1 2 3"
	test_parser(var, system_type)
	var = "1 2 3 a"
	test_parser(var, system_type)
	var = "- 1 2 3"
	test_parser(var, system_type)
	var = "+ 1 2 3"
	test_parser(var, system_type)
	
	# Test Number Limits
	puts "\033[0;35mOver INT_MAX/INT_MIN\033[0m"
	var = "2147483648 2 1"
	test_parser(var, system_type)
	var = "-2147483649 2 1"
	test_parser(var, system_type)
	puts "\033[0;35mOver LONG_MAX/LONG_MIN\033[0m"
	var = "+9223372036854775808 2 1"
	test_parser(var, system_type)
	var = "-9223372036854775809 2 1"
	test_parser(var, system_type)
	
	# Test Repeated Numbers
	puts "\033[0;35mRepeated Numbers\033[0m"
	var = "-1 -1 2"
	test_parser(var, system_type)
	var = "+1 1 2"
	test_parser(var, system_type)
end
