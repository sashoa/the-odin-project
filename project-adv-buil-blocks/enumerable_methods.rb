require './methods.rb'

p [2,6,3,9,4,4,30,65,14,5].my_each { |el| el + 1 }
p [2,6,3,9,4,4,30,65,14,5].my_each { |el| puts el + 1 }


p [2,6,3,9,4,4,30,65,14,5].my_each_with_index { |el, ind| puts "#{el + 1}, #{ind - 1}" }

p [2,6,3,9,4,4,30,65,14,5].my_select { |el| el < 10 }

p [2,6,3,9,4,4,30,65,14,5].my_all? { |el| el.is_a? Integer}

p [2,6,3,9,4,4,30,65,14,5].my_any? { |el| el == 0 }

p [2,6,3,9,4,4,30,65,14,5].my_none? { |el| el == 0 }

p [2,6,3,9,4,4,30,65,14,5].my_count { |el| el > 10 }

p [2,6,3,9,4,4,30,65,14,5].my_map { |el| el + 1 }

p [1,2,3,4,5,6,7,8,100].my_inject { |total, el| total * el}

def multiply_els(arr)
  arr.my_inject { |total, el| total * el }
end

p multiply_els([2,4,5])

my_proc = Proc.new { |el| el + 1 }

p [2,6,3,9,4,4,30,65,14,5].my_map(&my_proc)   # my_map takes a proc as a block

