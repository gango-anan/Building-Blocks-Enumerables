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

  def my_all?
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    y=0
    arr.my_each do |x|
      if yield (x) 
        y = true
      else
        y = false
        return y
      end
    end
    return y
  end

  def my_any?
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    y=0
    arr.my_each do |x|
      if yield (x) 
        y = true
        return y
      else
        y = false
      end
    end
    return y
  end

  def my_none?(arg=nil)
    arr=self
    n= arr.length-1
    pass=0
    n_array=[]
    y=0
    arr.my_each do |x|
      if yield (x) 
        y = false
        return y
      else
        y = true
      end
    end
    return y
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
     arr.my_select {|x| x==arg}.length
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
