def find_all(num)
	all_numbers = []
	i = 1
	sum = 0
	while i < num
		if ( i % 3 == 0) || (i % 5 == 0)
			all_numbers << i
			sum = sum + i
		end
		i += 1
	end
	return sum
end

puts find_all(1000)