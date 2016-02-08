def check_left(left)
	if left == 0
		return puts "zero"
	else
		return sayNumber(left)
	end
end
def sayNumber(number)
	puts number
end

check_left(0)