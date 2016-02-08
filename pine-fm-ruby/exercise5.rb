##-------------Words Entry + Sorting /w Arrays---------------##

words = []
input_s = "1"
temp = ""
while input_s != ""
	input_s = gets.chomp
	words.push(input_s)
end

#Sort
words.each do |word| 
	count = 0
	while (count < words.index(words.last) )
		if (words[count] > words[count +1])
			temp = words[count +1]
			words[count +1] = words[count]
			words[count] = temp
			count += 1
		else
			 count += 1
		end
	end
end
# words.sort!
puts "----------------------------------------------------------------------"
puts words

##-----------Table of contents /w Arrays------------##

array = [
	"table of contents",
	"Chapter 1:  Numbers",
	"Chapter 2:  Letters",
	"Chapter 3:  Variables",
	"page1",
	"page72",
	"page118"
]

linewidth = 75
puts array[0].upcase.center linewidth
puts array[1].ljust(linewidth / 2 ) + array[4].rjust(linewidth / 2 )
puts array[2].ljust(linewidth / 2 ) + array[5].rjust(linewidth / 2 )
puts array[3].ljust(linewidth / 2 ) + array[6].rjust(linewidth / 2 )
