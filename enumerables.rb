module Enumerable
  def my_each
    arr=self.to_a
    n= arr.length-1
    i=0  
    n_array=[]
     for i in 0..n do
     x=arr[i]
     n_array[i] = yield(x)
    end
    return self
  end

  def my_each_with_index
    arr=self.to_a
    n= arr.length-1
    i=0
    n_array=[]
    for i in 0..n do
    x=arr[i]
    n_array[i] = yield(x,i)
    end
    return self
  end

  
  def my_select
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    arr.my_each { |x| n_array << x if yield (x) }
    return n_array
  end

  def my_all?(arg=nil)
    arr=self
    n= arr.length-1
    y= true
    if block_given?
    arr.my_each do |x|
      if yield (x) 
        y = true
      else
        y = false
        return y
      end
    end
   elsif !block_given? && arg==nil
    y=true
   else
    arr.my_each do |x|
      if x != arg
        y=false
      else
        y=true
    end  
   end
   end
    return y

  end

  def my_any?(arg=nil)
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    y=false
    if block_given? 
      arr.my_each do |x|
        if yield (x)
          y = true
          return y
        else
        y = false
        end
      end
      return y
    elsif !block_given? && arg==nil
       arr.my_each do |x|
        if arr!=nil
          y=true
          return y
        else
          return y
        end
      end
    else 
      arr.my_each do |x|
        if x == arg
          y=true
          return y
        end
      end
    end
    return y
  end


  def my_none?(arg=nil)
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    y=true
    if block_given?
      arr.my_each do |x|
        if yield (x)
          y = false
        return y
      else
        y = true
      end
    end
    return y
  elsif !block_given? && arg==nil
    arr.my_each do |x|
      if arr==nil
        y=true
        return y
      else
        return y
      end
    end
  else
    arr.my_each do |x|
      if x != arg
        y=true
        return y
      end
    end
  end
end

  def my_count(arg=nil)
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    y=0
    if block_given?
      arr.my_each { |x| y += 1 if yield (x) }
    elsif !block_given? && arg==nil
     y=arr.length
    else 
     y=arr.my_select {|x| x==arg}.length
    end
    return y
  end

  def my_map
    array=self.to_a
    index = 0
    newArray = Array.new

    while index < array.length
      newArray[index] = yield(array[index])
      index += 1
    end

    newArray
  end

  def my_inject
    array=self.to_a
    index = 0
    sum = 0
    
    while index < array.length
      sum += yield(array[index])
      index += 1
    end
    sum
  end

end

# puts '1.--------my_each--------'
# %w[Sharon Leo Leila Brian Arun].my_each { |friend| puts friend }

# puts '2.--------my_each_with_index--------'
# %w[Sharon Leo Leila Brian Arun].my_each_with_index { |friend, index| puts friend if index.even? }

# puts '3.--------my_select--------'
# puts (%w[Sharon Leo Leila Brian Arun].my_select { |friend| friend != 'Brian' })

puts '4.--------my_all--------'
puts (%w[ant bear cat].my_all? { |word| word.length >= 3 }) #=> true
puts (%w[ant bear cat].my_all? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_all?(/t/) #=> false
puts [1, 2i, 3.14].my_all?(Numeric) #=> true
puts [].my_all? #=> true

puts '5.--------my_any--------'
puts (%w[ant bear cat].any? { |word| word.length >= 3 })
puts (%w[ant bear cat].my_any? { |word| word.length >= 4 }) #=> true
puts %w[ant bear cat].my_any?(/d/) #=> false
puts [nil, true, 99].my_any? #=> true
puts [].my_any? #=> false

puts '6.--------my_none--------'
puts (%w[ant bear cat].my_none? { |word| word.length == 5 }) #=> true
puts (%w[ant bear cat].my_none? { |word| word.length >= 4 }) #=> false
puts %w[ant bear cat].my_none?(/d/) #=> true
puts [].my_none? #=> true
puts [nil].my_none? #=> true
puts [nil, false].my_none? #=> true
puts [nil, false, true].my_none? #=> false

puts '7.--------my_count--------'
arr = [1, 2, 4, 2]
puts arr.my_count #=> 4
puts arr.my_count(2) #=> 2
puts (arr.my_count { |x| (x % 2).zero? }) #=> 3

 puts '8.--------my_maps--------'
 my_order = ['medium Big Mac', 'medium fries', 'medium milkshake']
 puts (my_order.my_map { |item| item.gsub('medium', 'extra large') })
 puts ((0..5).my_map { |i| i * i })
 puts 'my_map_proc'

puts '8.--------my_inject--------'
puts ((1..5).my_inject { |sum, n| sum + n }) #=> 15
puts (1..5).my_inject(1) { |product, n| product * n } #=> 120
longest = %w[ant bear cat].my_inject do |memo, word|
memo.length > word.length ? memo : word
end
puts longest 
