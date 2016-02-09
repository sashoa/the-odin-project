options = {}
def calculate(*numbers, options)
   add(*numbers) if options[:add]
   subtract(*numbers) if options[:subtract]
end

def add(*numbers)
  numbers.each do |i|
    sum = sum + i
  end
end

def subtract(*numbers)
  numbers.each do |i|
    sum = sum - i
  end
end