def norminette()
	norminette = `norminette ../ | grep Error | wc -l | tr -d ' ' | tr -d '\n'`
	if norminette.to_i == 0
		puts "\033[1;42mNORMINETTE OK\033[0m"
	else
		puts "\033[1;41mNORMINETTE KO\033[0m"
	end
end

def check_moves(x, moves_count, checker_output, exit_status)
	result = case x
	when 1
		moves_count.to_i == 0 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 2, 3
		moves_count.to_i <= 3 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 4, 5
		moves_count.to_i <= 12 && checker_output == "OK" ? "\tOK" : "\tKO"
	when 100
		case moves_count.to_i
		when 0...700 then "\t5 Points!"
		when 700...900 then "\t4 Points!"
		when 900...1100 then "\t3 Points!"
		when 1100...1300 then "\t2 Points!"
		when 1300...1500 then "\t1 Points!"
		else "\tKO"
		end
	when 500
		case moves_count.to_i
		when 0...5500 then "\t5 Points!"
		when 5500...7000 then "\t4 Points!"
		when 7000...8500 then "\t3 Points!"
		when 8500...10000 then "\t2 Points!"
		when 10000...11500 then "\t1 Points!"
		else "\tKO"
		end
	else "\tKO"
	end
	if checker_output != "OK"
		result = "\tKO"
	end
	if exit_status.to_i == 139
		puts "\033[1;31m\tSegmentation fault 💀\033[0m"
		return
	elsif result == "\tKO"
		puts "\033[1;31m#{result}\033[0m"
	else
		puts "\033[1;32m#{result}\033[0m"
	end
end

def set_size(x)
	if x == 1
		return 1
	elsif x == 2
		return 2
	elsif x == 3
		return 10
	elsif x == 5
		return 20
	elsif x == 100 || x == 500
		return 50
	else
		return 10
	end
end

def check_system()
	system_type = `uname -s`
	if (system_type == "Linux\n")
		return ("Linux")
	elsif (system_type == "Darwin\n")
		return ("Mac")
	end
end

def all_combinations(x)
    # Genera todas las combinaciones de números entre 1 y 3
    combinations = (1..x).to_a.permutation.to_a

    # Imprime todas las combinaciones
    combinations.each do |combination|
    # puts combination.join(' ')
    end
end

def generate_sequence(tot)
    phi = (Math.sqrt(5) - 1) / 2 * tot
  
    sequence = Array.new(tot, 0)
    result = []
  
    i = 0
    nd = phi
    loop do
        break if i >= tot
        rounded_value = nd.round
  
        if sequence[rounded_value] == 0
            result << rounded_value
            sequence[rounded_value] = 1
            i += 1
        end

        nd += phi
        nd %= tot if nd > tot
    end
    result
end

def generate_random_sequence(x)
	if x == 3 || x == 2 || x == 1
	  (1..x).to_a.shuffle
	elsif x == 35 || x == 100 || x == 150 || x == 500
	  (1..1000).to_a.shuffle[0, x].map { |n| n * (rand(2).zero? ? 1 : -1) }
	else
	  (1..x).to_a.shuffle
	end
end
