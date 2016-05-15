module Enumerable 

  def my_each
    i = 0
    while i < self.length
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    a = Array.new
    self.my_each { |el| a << el if yield(el) } 
    a
  end

  def my_all?
    is_true = true
    self.my_each { |el| is_true = false if !yield(el)  }
    is_true
  end

  def my_any?
    self.my_each { |el| return true if yield(el) }
    false
  end

  def my_none?
    self.my_each { |el| return false if yield(el) }
    true
  end

  def my_count
    count = 0
    self.my_each { |el| count += 1 if yield(el) }
    count
  end

  def my_map
    a = Array.new
    self.my_each do |el|
      if block_given?
        a << yield(el)
      elsif my_proc
        a << my_proc.call(el) 
      else return "No block"
      end
    end
    a
  end

  def my_inject
    result = 1
    self.my_each { |el| result = yield(result, el) }
    result
  end
end
