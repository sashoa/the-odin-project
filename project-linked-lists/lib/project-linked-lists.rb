require './linked-lists.rb'
require './node.rb'

list = LinkedList.new
puts "\n"
puts "#append('hello1')".ljust(25) + "=> " + list.append("hello1")
puts "#append('hello2')".ljust(25) + "=> " + list.append("hello2")
puts "#append('hello3')".ljust(25) + "=> " + list.append("hello3")
puts "#append('hello4')".ljust(25) + "=> " + list.append("hello4")
puts "#append('hello5')".ljust(25) + "=> " + list.append("hello5")
puts "#to_s:"
puts list.to_s.to_s
puts "\n"
puts "#prepend('prepend1')".ljust(25) + "=> " + list.prepend("prepend1")
puts "#prepend('prepend2')".ljust(25) + "=> " + list.prepend("prepend2")
puts "#prepend('prepend3')".ljust(25) + "=> " + list.prepend("prepend3")
puts "#to_s:"
puts list.to_s.to_s

puts "\n"
puts "#tail".ljust(25) + "=> " + list.tail
puts "#head".ljust(25) + "=> " + list.head
puts "#size".ljust(25) + "=> " + list.size.to_s
puts "#at(4)".ljust(25) + "=> " + list.at(4)
puts "#contains?('hello5')".ljust(25) + "=> " + list.contains?("hello5").to_s
puts "#find('hello5')".ljust(25) + "=> " + list.find("hello5").to_s
puts "#insert_at(7, 'test')".ljust(25) + "=> " + list.insert_at(7, "test").to_s
puts "#to_s:"
puts list.to_s.to_s

puts "\n"
puts "#remove_at(4)".ljust(25) + "=> " + list.remove_at(4).to_s

puts "#to_s:"
puts list.to_s.to_s

puts "\n"
puts "#pop".ljust(25) + "=> " + list.pop

puts "#to_s:"
puts list.to_s.to_s

puts "\n"
puts "#size".ljust(25) + "=> " + list.size.to_s
