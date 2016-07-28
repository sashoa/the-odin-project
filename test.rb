class Array
  def diff(a, result = [])
    self.each { |el| result << el if !a.include?(el) }
    a.each { |el| result << el if !self.include?(el) }
    result
  end
end

a = []
b = [1,2]

def array_diff(a, b)
  result = []
  a.each { |el| result << el unless b.include?(el) }
  b.each { |el| result << el unless a.include?(el) }
  result
end

p a.diff(b)

p array_diff(a, b)
