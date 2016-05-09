dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts "Input word for substring check"
words = gets.chomp

words = words.split(" ").each { |word| word.slice!(/[^a-zA-Z]/) }

def substrings(word, dictionary)
  result = Hash.new(0)
  dictionary.each do |str|
    word.downcase.match(/(#{str})/) { |m| result[str] += 1 }
    end
  result
end

a = Hash.new(0)
words.each do |word|
  b = substrings(word, dictionary)
  b.each do |key,value|
    a[key] += value  
  end
end

puts a
