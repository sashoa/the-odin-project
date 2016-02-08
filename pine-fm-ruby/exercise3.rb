##-----------The Angry Boss---------##

puts "What do you want?"
answer = gets.chomp
puts "WHADDAYA MEAN \"#{answer.upcase}\"?? YOU'RE FIRED!!"

##---------Table of contents-------------##

linewidth = 75
title = "table of contents"
chapter1 = "Chapter 1:  Numbers"
chapter2 = "Chapter 1:  Letters"
chapter3 = "Chapter 1:  Variables"
page1 = "page 1"
page72 = "page 72"
page118 = "page 118"

puts title.upcase.center linewidth
puts chapter1.ljust(linewidth / 2) + page1.rjust(linewidth / 2)
puts chapter2.ljust(linewidth / 2) + page72.rjust(linewidth / 2)
puts chapter3.ljust(linewidth / 2) + page118.rjust(linewidth / 2)

