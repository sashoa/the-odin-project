def project2(num)
	array = []
	sum = []
	array << 1 << 2
	i = 0
	value = 0
	# puts array
	while value < num
		value = array[i] + array[i+1]
		array << value
		i += 1
	end
	# puts array
	array.each do |j|
		if j.even?
			# sum = sum + j
			sum << j
		end
	end
	return  sum.inject(:+)
end

puts project2(4000000)