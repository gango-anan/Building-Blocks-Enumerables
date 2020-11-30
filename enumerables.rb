# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    n_array = []
    while i < to_a.length
      x = to_a[i]
      n_array[i] = yield(x)
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    n_array = []
    while i < to_a.length
      x = to_a[i]
      n_array[i] = yield(x, i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    arr = self
    n_array = []
    arr.my_each { |x| n_array << x if yield x }
    n_array
  end

  def my_all?(arg = nil)
    arr = self
    if block_given?
      arr.my_each { |x| return false if yield(x) == false }
      return true
    elsif !block_given? && arg.nil?
      arr.my_each { |x| return false if x.nil? || x == false }
    elsif arg.is_a?(Class)
      arr.my_each { |x| return false unless x.is_a?(arg) }
    elsif arg.is_a?(Regexp)
      arr.my_each { |x| return false unless arg.match(x) }
    else
      arr.my_each { |x| return false if x != arg }
    end
    true
  end

  def my_any?(arg = nil)
    arr = self
    if block_given?
      arr.my_each { |x| return true if yield x }
    elsif !block_given? && arg.nil?
      arr.my_each { |x| return true unless x.nil? || x == false }
    elsif arg.is_a?(Class)
      arr.my_each { |x| return true if x.is_a?(arg) }
    elsif arg.is_a?(Regexp)
      arr.my_each { |x| return true if arg.match(x) }
    else
      arr.my_each { |x| return true if x == arg }
    end
    false
  end

  def my_none?(arg = nil)
    arr = self
    return !arr.my_any?(arg) unless block_given?

    arr.my_each { |x| return false if yield x }
    true
  end

  def my_count(arg = nil)
    y = 0
    if block_given?
      to_a.my_each { |x| y += 1 if yield x }
    elsif !block_given? && arg.nil?
      y = to_a.length
    else
      y = to_a.select { |x| x == arg }.length
    end
    y
  end

  def my_map(arg = nil)
    return to_enum(:my_map) unless block_given?

    index = 0
    n_array = []
    while index < to_a.length
      n_array[index] = arg.nil? ? yield(to_a[index]) : !yield(to_a[index])
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
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

def multiply_els(elements)
  elements.my_inject(:*)
end

puts 'multiply_els'
puts multiply_els([2, 4, 5])
