def fibs(n, arr = [0,1])
  return if n == 2
  arr << arr[-2] + arr[-1]
  fibs(n-1, arr)
  arr
end

p fibs(20)
