# def append(arr, n)
#   return arr if n < 0
#   arr << n
#   append(arr, n-1)
#   arr
# end


# def reverse_append(arr, n)
#   return arr if n < 0
#   reverse_append(arr, n - 1)
#   arr << n
#   arr
# end

# a = []
# b = []
# puts append(a, 8)
# puts reverse_append(b, 8)

# def beer(n)
#   return if n == 0
#   puts "#{n} bottles of beer on the wall. Take one down and pass it arround. #{ n - 1 } bottles of beer on the wall"
#   beer(n - 1)
# end
# beer(99)

# def fibonacci_value(n)
#   if n == 0
#     puts n
#     0
#   elsif n == 1
#     puts n
#     1
#   else
#     puts n
#     fibonacci_value(n-1) + fibonacci_value(n - 2)
#   end
# end

# puts fibonacci_value(6)

# def flatten(arr, result = [])
#   arr.each do |el|
#     el.instance_of?(Array) ? flatten(el, result) : result << el
#   end
#   result
# end

# p flatten([[1,[8,9]],[3,4]])

$roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}


def method_name(n)
  return $roman_mapping[n] if n <= 10
  a = $roman_mapping.select { |key, el| n % key == 1 }
  a = a.first
  a[1] + method_name(n - a[0]) 
end

puts method_name(687)
