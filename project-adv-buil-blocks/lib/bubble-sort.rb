def swap(n,a)                                             #swap the elements
  a[n], a[n + 1] = a[n + 1], a[n]
end

def bubble_sort_by(arr)
  i = 1
  arr.each do |el|
    j = 0
    store = 0
    while j < arr.length - i
    store = yield(arr[j], arr[j + 1])
      swap(j, arr) if store > 0
    j += 1
    end
    i += 1
  end
end

def bubble_sort(arr)
  i = 1
  arr.each do |el|
    j = 0
    while j < arr.length - i
      swap(j, arr) if arr[j] > arr[j + 1]
    j += 1
    end
    i += 1
  end
end

p bubble_sort([2,1,6,4,8,9,9,0,11,11,100,50,47,46,45,67,68,101])

p(bubble_sort_by(["hello","hay","sashe","otorhinolaryngologist","apostolovski"]) do |left, right|
  left.length - right.length
end)
p(bubble_sort_by(["hello","hay","sashe","otorhinolaryngologist","apostolovski"]) do |left, right|
  right.length - left.length
end)
