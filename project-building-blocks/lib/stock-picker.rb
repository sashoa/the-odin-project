def stock_picker(arr)
  buy = 0
  sell = 0
  res = 0
  arr.each do |stock|
    i = arr.index(stock) + 1
    while i < arr.length do
      if res <= arr[i] - stock
        res = arr[i] - stock
        buy = arr.index(stock)
        sell = i
      end
      i += 1
    end
  end
  return [buy,sell].to_s
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
puts stock_picker([17,3,6,9,15,8,6,1,0])
