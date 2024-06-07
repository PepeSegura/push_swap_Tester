import math
import subprocess
import itertools
import random

def norminette():
    result = subprocess.run(['norminette', '../'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    if result.returncode == 0:
        print("\033[1;42mNORMINETTE OK\033[0m")
    else:
        print("\033[1;41mNORMINETTE KO\033[0m")

def check_moves(x, moves_count, checker_output, exit_status):
    moves_count = int(moves_count)
    exit_status = int(exit_status)
    result = "\tKO"

    match x:
        case 1:
            result = "\tOK" if moves_count == 0 and checker_output == "OK" else "\tKO"
        case 2 | 3:
            result = "\tOK" if moves_count <= 3 and checker_output == "OK" else "\tKO"
        case 4 | 5:
            result = "\tOK" if moves_count <= 12 and checker_output == "OK" else "\tKO"
        case 100:
            if moves_count < 700:
                result = "\t5 Points!"
            elif moves_count < 900:
                result = "\t4 Points!"
            elif moves_count < 1100:
                result = "\t3 Points!"
            elif moves_count < 1300:
                result = "\t2 Points!"
            elif moves_count < 1500:
                result = "\t1 Points!"
            else:
                result = "\tKO"
        case 500:
            if moves_count < 5500:
                result = "\t5 Points!"
            elif moves_count < 7000:
                result = "\t4 Points!"
            elif moves_count < 8500:
                result = "\t3 Points!"
            elif moves_count < 10000:
                result = "\t2 Points!"
            elif moves_count < 11500:
                result = "\t1 Points!"
            else:
                result = "\tKO"
        case _:
            result = "\tKO"

    if checker_output != "OK":
        result = "\tKO"

    if exit_status == 139:
        print("\033[1;31m\tSegmentation fault 💀\033[0m")
        return
    elif result == "\tKO":
        print(f"\033[1;31m{result}\033[0m")
    else:
        print(f"\033[1;32m{result}\033[0m")

def set_size(x):
	if x == 1:
		return 1
	elif x == 2:
		return 2
	elif x == 3:
		return 10
	elif x == 5:
		return 20
	elif x == 100 or x == 500:
		return 50
	else:
		return 10

def check_system():
	result = subprocess.run(['uname', '-s'], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
	if (result.stdout.decode('utf-8') == "Linux\n"):
		return ("Linux")
	elif (result.stdout.decode('utf-8') == "Darwin\n"):
		return ("Mac")

def all_combinations(x):
    # Generate all permutations of numbers from 1 to x
    combinations = list(itertools.permutations(range(1, x+1)))

    # Print all combinations
    for combination in combinations:
        print(' '.join(map(str, combination)))

def generate_sequence(tot):
    phi = (math.sqrt(5) - 1) / 2 * tot
    
    sequence = [0] * tot
    result = []
    
    i = 0
    nd = phi
    
    while i < tot:
        rounded_value = int(round(nd)) % tot
        
        if sequence[rounded_value] == 0:
            result.append(rounded_value)
            sequence[rounded_value] = 1
            i += 1
        
        nd += phi
        nd %= tot  # Ensure nd stays within bounds by using modulo directly here
    
    return result

def generate_random_sequence(x):
    if x in [1, 2, 3]:
        return random.sample(range(1, x + 1), x)
    elif x in [35, 100, 150, 500]:
        return [n * (1 if random.randint(0, 1) == 0 else -1) for n in random.sample(range(1, 1001), x)]
    else:
        return random.sample(range(1, x + 1), x)
