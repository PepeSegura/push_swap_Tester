import subprocess
import os

def run_command(command):
    try:
        subprocess.run(command, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error occurred with exit status: {e.returncode}")
        return e.returncode
        


def test_parser(var, system_type):
    exit_status     = 0
    stdout_count    = 0
    stderr_count    = 0
    print (f"var: [{var}]")
    cmd = f"../push_swap {var} > stdout 2> stderr"
    exit_status = run_command(cmd)
    print ("Exit_status: ", exit_status)

    with open("stdout", "r") as f:
        for line in f:
            stdout_count += 1
        print("stdout_count: ", stdout_count)

    with open("stderr", "r") as f:
        for line in f:
            stderr_count += 1
        print("stdout_err: ", stderr_count)


    system(f"cat .moves | ./srcs/checker_{system_type} {var} > .checker_out 2> .checker_err")

    checker_out = `cat .checker_out | wc -l | tr -d ' ' | tr -d '\n'`
	# printf "checker_out [%s]\n", checker_out
    checker_err = `cat .checker_err | wc -l | tr -d ' ' | tr -d '\n'`

    # # Print Result
    print (f"[{var:<25}]")
    if int(exit_status) == 139:
        print("\033[1;31m%10s\n\033[0m" % " \tSegmentation fault 💀")
    elif int(stdout_count) == 0 and int(stderr_count) != 0 and int(checker_err) == 1:
        print("\033[1;32m%10s\n\033[0m" % "OK")
    elif int(stdout_count) > 0 and int(stderr_count) == 0 and int(checker_err) == 1:
        print("\033[1;31m%10s\n\033[0m" % " \tNot in STDERR")
    elif int(stdout_count) >= 0 and int(checker_out) == 1:
        print("\033[1;32m%10s\n\033[0m" % "OK")

    # # Clean up temporary files
    # os.remove(".error")
    # os.remove(".moves")
    # os.remove(".exit_status")
    # os.remove(".checker_out")
    # os.remove(".checker_err")

# Example usage
test_parser("789 456 72", "Linux")

