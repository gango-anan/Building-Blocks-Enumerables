# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
module Enumerable
  def my_each
    return to_enum(:my_each) if !block_given?
    arr = to_a
    i = 0
    n_array = []
    while i < arr.length
      x = arr[i]
      n_array[i] = yield(x)
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each) if !block_given?
    arr = to_a
    i = 0
    n_array = []
    while i < arr.length
      x = arr[i]
      n_array[i] = yield(x, i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_each) if !block_given?
    arr = self
    n_array = []
    arr.my_each { |x| n_array << x if yield x }
    n_array
  end

   def my_all?(arg = nil)
     arr = self
     y=true
     if block_given?
      arr.my_each { |x| return false if yield(x) == false }
      return true
     elsif !block_given? && arg.nil?
       return true
     elsif arg.is_a? (Class)
       arr.my_each {|x| return false if  !x.is_a?(arg)}
     elsif arg.is_a?(Regexp)
      arr.my_each { |x| return false if !arg.match(x)}
     else
       arr.my_each {|x| return false if x!=arg}
   end
     y
   end


  def my_any?(arg = nil)
    arr = self
    if block_given?
      arr.my_each { |x| return true if yield x }
    elsif !block_given? && arg.nil?
      arr.my_each { return true unless arr.nil? }
    elsif arg.is_a?(Class)
      arr.my_each { |x| return true if x.is_a?(arg)}
    elsif arg.is_a?(Regexp)
      arr.my_each { |x| return true if arg.match(x)}
    else
      arr.my_each { |x| return true if x == arg }
    end
    false
  end

  def my_none?(arg = nil)
    arr = self
    if block_given?
      arr.my_each { |x| return false if yield x }
    else
     return !arr.my_any?(arg) 
    end
    true
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
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

def multiply_els(elements)
  elements.my_inject(:*)
end

puts 'multiply_els'
puts multiply_els([2, 4, 5])

# 4. my_all? (example test cases)
puts 'my_all?'
puts '-------'
 p [3, 5, 7, 11].my_all?(&:odd?) # => true
 p [-8, -9, -6].my_all? { |n| n < 0 } # => true
 p [3, 5, 8, 11].my_all?(&:odd?) # => false
 p [-8, -9, -6, 0].my_all? { |n| n < 0 } # => false
 # test cases required by tse reviewer
 p [1, 2, 3, 4, 5].my_all? # => true
p [1, 2, 3].my_all?(Integer) # => true
 p %w[dog door rod blade].my_all?(/d/) # => true
 p [1, 1, 1].my_all?(1) # => true
puts

# 5. my_any? (example test cases)
puts 'my_any?'
puts '-------'
p [7, 10, 3, 5].my_any?(&:even?) # => true
p [7, 10, 4, 5].my_any?(&:even?) # => true
p %w[q r s i].my_any? { |char| 'aeiou'.include?(char) } # => true
p [7, 11, 3, 5].my_any?(&:even?) # => false
p %w[q r s t].my_any? { |char| 'aeiou'.include?(char) } # => false
# test cases required by tse reviewer
p [3, 5, 4, 11].my_any? # => true
p [1, nil, false].my_any?(1) # => true
p [1, nil, false].my_any?(Integer) # => true
p %w[dog door rod blade].my_any?(/z/) # => false
p [1, 2, 3].my_any?(1) # => true
puts

# 6. my_none? (example test cases)
puts 'my_none?'
puts '--------'
p [3, 5, 7, 11].my_none?(&:even?) # => true
p %w[sushi pizza burrito].my_none? { |word| word[0] == 'a' } # => true
p [3, 5, 4, 7, 11].my_none?(&:even?) # => false
p %w[asparagus sushi pizza apple burrito].my_none? { |word| word[0] == 'a' } # => false
# test cases required by tse reviewer
p [1, 2, 3].my_none? # => false
p [1, 2, 3].my_none?(String) # => true
p [1, 2, 3, 4, 5].my_none?(2) # => false
p [1, 2, 3].my_none?(4) # => true
puts

# 7. my_count (example test cases)
puts 'my_count'
puts '--------'
p [1, 4, 3, 8].my_count(&:even?) # => 2
p %w[DANIEL JIA KRITI dave].my_count { |s| s == s.upcase } # => 3
p %w[daniel jia kriti dave].my_count { |s| s == s.upcase } # => 0
# test cases required by tse reviewer
p [1, 2, 3].my_count # => 3
p [1, 1, 1, 2, 3].my_count(1) # => 3
puts

# 8. my_map
puts 'my_map'
puts '------'
p [1, 2, 3].my_map { |n| 2 * n } # => [2,4,6]
p %w[Hey Jude].my_map { |word| word + '?' } # => ["Hey?", "Jude?"]
p [false, true].my_map(&:!) # => [true, false]
my_proc = proc { |num| num > 10 }
p [18, 22, 5, 6].my_map(my_proc) { |num| num < 10 } # => true true false false
puts
