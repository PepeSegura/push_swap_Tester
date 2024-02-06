require_relative 'functions.rb'
require_relative 'test_parser.rb'
require_relative 'push_swap_tester.rb'
require_relative 'check_results.rb'

# Check if system is Linux or Mac
system_type = check_system()

# Check for norminette
norminette()

# Check for parse errors
tester_parser(system_type)

# Launch main_test
main_tester(system_type)

puts "\n\033[0;36mNumbers\tLowest\tAverage\tHighest\tScore\033[0m"

check_results(1)
check_results(2)
check_results(3)
check_results(5)
check_results(100)
check_results(500)

system("rm -f .results .exit_status")

# "when in doubt, do Fibonacci" by fsusanna 2024
