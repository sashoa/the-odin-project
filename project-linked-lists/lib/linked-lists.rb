class LinkedList
  attr_accessor :head
  def initialize
    @head_state = nil
    @size = 0
  end

  def append(value)
    if @size.zero?
      @head_state = Node.new(value)
      @size += 1
      value
    else 
      traverse(@head_state).next_node = Node.new(value)
      @size += 1
      value
    end
  end
  
  def prepend(value)
    if @size.zero?
      @head_state = Node.new(value, next_node)
      @size += 1
      value
    else
      tmp = @head_state
      @head_state = Node.new(value, tmp)
      @size += 1
      value
    end
    
  end

  def size
    @size
  end

  def head
    @head_state.value  
  end

  def tail
    traverse(@head_state).value
  end
  
  def at(index, a = @head_state)
    return a.value if index == 0
    at(index -1, a.next_node)
  end

  def pop(a = @head_state)
    if a.next_node.next_node.nil?
      value = a.next_node.value
      a.next_node = nil
      @size -= 1
      return value
    end
    pop(a.next_node)
  end

  def contains?(str, a = @head_state)
    if a.value.to_s == str
      true
    elsif a.next_node.nil?
      false
    else
      contains?(str, a.next_node)
    end
  end

  def find(data, i = 0, a = @head_state)
    if a.value.to_s == data
      i
    elsif a.next_node.nil?
      "nil"
    else
      find(data, i+1, a.next_node)
    end
  end

  def to_s(a = @head_state)
    print "( #{a.value} )"
    print " -> " unless a.next_node.nil?
    return if a.next_node.nil?
    to_s(a.next_node)
  end

  def insert_at(i, value, a = @head_state)
    if i == 0
      @head_state = Node.new(value, @head_state)
      @size += 1
      value
    elsif i > 1 && a.next_node.next_node.nil?
      "Out of range"
    elsif i == 1
      tmp = a.next_node
      a.next_node = Node.new(value, tmp)
      @size += 1
      value
    else
      insert_at(i-1, value, a.next_node)
    end
  end

  def remove_at(i, a = @head_state)
    if i == 0
      tmp = @head_state
      @head_state = @head_state.next_node
      @size -= 1
      tmp.value
    elsif i > 1 && a.next_node.next_node.nil?
      return "Out of range"
    elsif i == 1
      tmp = a.next_node
      a.next_node = tmp.next_node
      @size -= 1
      tmp.value
    else
      remove_at(i-1, a.next_node)
    end
  end


  def traverse(a)
    return a if a.next_node.nil?
    traverse(a.next_node)
  end

end
