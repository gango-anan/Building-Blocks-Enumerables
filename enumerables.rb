module Enumerable
  def my_each
    arr = to_a
    n = arr.length
    i = 0
    n_array = []
    while i < n
      x = arr[i]
      n_array[i] = yield(x)
      i += 1
    end
    self
  end

  def my_each_with_index
    arr = to_a
    n = arr.length
    i = 0
    n_array = []
    while i < n
      x = arr[i]
      n_array[i] = yield(x, i)
      i += 1
    end
    self
  end

  def my_select
    arr = self
    n_array = []
    arr.my_each { |x| n_array << x if yield x }
    n_array
  end

  def my_all?(arg = nil)
    arr = self
    y = false
    if block_given?
      arr.my_each do |x|
        y = if yield x
              true
            else
              false
            end
        return y
      end
    elsif !block_given? && arg.nil?
      y = true
    else
      arr.my_each do |x|
        y = x == arg
      end
    end
    y
  end

  def my_any?(arg = nil)
    arr = self
    if block_given?
      arr.my_each { |x| return true if yield x }
    elsif !block_given? && arg.nil?
      arr.my_each { return true unless arr.nil? }
    else
      arr.my_each { |x| return true if x == arg }
    end
    return false
  end

  def my_none?(arg = nil)
    arr = self
    y = true
    if block_given?
      arr.my_each do |x|
        return false if yield x
      end
    elsif !block_given? && arg.nil?
      arr.my_each do |x|
        return false if !x.nil? || x != false
      end
    else
      arr.my_each do |x|
        return true if x != arg
      end
    end
    y
  end

  def my_count(arg = nil)
    arr = self
    y = 0
    if block_given?
      arr.my_each { |x| y += 1 if yield x }
    elsif !block_given? && arg.nil?
      y = arr.length
    else
      y = arr.my_select { |x| x == arg }.length
    end
    y
  end

  def my_map(arg = nil)
    array = to_a
    index = 0
    n_array = []
    while index < array.length
      n_array[index] = arg.nil? ? yield(array[index]) : yield(arg[index])
      index += 1
    end
    n_array
  end

  def my_inject(arg1 = nil, arg2 = nil)
    if (!arg1.nil? && arg2.nil?) && (arg1.is_a?(Symbol) || arg1.is_a?(String))
      arg2 = arg1
      arg1 = nil
    end
    if !block_given? && !arg2.nil?
      my_each { |ele| arg1 = arg1.nil? ? ele : arg1.send(arg2, ele) }
    else
      my_each { |ele| arg1 = arg1.nil? ? ele : yield(arg1, ele) }
    end
    arg1
  end
end

def multiply_els(elements)
  elements.my_inject(:*)
end
