def fibs(n)
  first = 0
  second = 1
  new = [first, second]
  (n - 2).times do 
    new << first + second
    first, second = new[-2], new[-1]
  end
  new
end

puts fibs(20)
