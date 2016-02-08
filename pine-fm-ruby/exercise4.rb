##---------Weird Beer Song----------##

left_beer = 99
on_the_wall =
while (left_beer > 0 )
	if (left_beer == 1) 
		on_the_wall = "no more"
	else 
		on_the_wall = (left_beer - 1).to_s
	end
	puts  "#{left_beer.to_s} bottles of beer on the wall, #{left_beer.to_s} bottles of beer.
Take one down and pass it around, #{on_the_wall} bottles of beer on the wall.\n "
left_beer = left_beer - 1
end
puts  "No more bottles of beer on the wall, no more bottles of beer. 
Go to the store and buy some more, 99 bottles of beer on the wall.
"

##-------Deaf Grandma---------##

ask = "Ask your grandma: "
bye = false
bye_count = 0
while (bye_count < 3)
	puts ask
	say = gets.chomp	
	year = rand(1930 .. 1950)
	if say == "BYE"
		bye_count += 1
		if (bye_count == 3)
			puts "OK, HAVE A NICE DAY. ARE YOU SURE YOU'RE NOT HUNGRY?"
		end
	elsif (say == say.upcase)
		puts "NO, NOT SINCE #{year.to_s}!"
	else  puts "HUH?!  SPEAK UP, SONNY!"
	end
	
end

##-------------Leap Years---------------##

puts "Enter start year: "
start_year = gets.chomp.to_i
puts "Enter end year: "
end_year = gets.chomp.to_i

if ((start_year >= end_year) || ((start_year < 1)|| (end_year < 1) ))
	puts "Your entered values does not make sense"
else
	puts "\n"
	puts "There we go:\n"
	while (start_year <= end_year)
		if start_year < 4
			start_year = 4
		end
		if (start_year % 2 == 0)
			if (start_year % 4 == 0)
				if (start_year.to_f % 100 != 0)
				puts start_year
				else
					if (start_year.to_f % 400 == 0)
						puts start_year
					end
				end
				start_year += 4	
			else 
				start_year += 2
			end
		else
			start_year += 1
		end
	end
end