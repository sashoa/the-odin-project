def merge_sort(arr, result = [])
 return arr if arr.length == 1
 a = arr[0..(arr.length / 2) -1]
 b = arr[(arr.length / 2)..-1]

 merge(merge_sort(a),merge_sort(b),result)
end

def merge(a,b,arr)
  i = 0
  j = 0
  k = 0
  while i < a.length && j < b.length
    if a[i] <= b[j]
      arr[k] = a[i]
      i += 1
    else a[i] > b[j]
      arr[k] = b[j]
      j += 1
    end
    k += 1
  end
  while a[i]
    arr[k] = a[i]
    i += 1
    k += 1
  end
  while b[j]
    arr[k] = b[j]
    j += 1
    k += 1
  end
  arr
end

p merge_sort([2,7,4,6,8,22,55,25,15])
