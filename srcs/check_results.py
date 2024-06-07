def check_results(category)
	error_found = 0
    moves_list = []
  
    File.open(".results", 'r') do |file|
      file.each_line do |line|
        category_str, moves_str = line.strip.split('-')
		if moves_str == " Segmentation Fault"
			error_found = 139
		end
        moves_list << moves_str.to_i if category_str.to_i == category
      end
    end
  
    mean = (moves_list.sum / moves_list.length.to_f).round()
    lowest = moves_list.min
    highest = moves_list.max
  
    print "#{category}\t#{lowest}\t#{mean}\t#{highest}"
    check_moves(category, mean, "OK", error_found)
end
