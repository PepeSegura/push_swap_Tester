require_relative 'functions.rb'
require_relative 'test_parser.rb'
require_relative 'push_swap_tester.rb'

# Check if system is Linux or Mac
system_type = check_system()

# Check for norminette
norminette()

# Check for parse errors
tester_parser()

# Launch main_test
main_tester(system_type)

# fsusanna test
# tester_fsusanna(system_type)
