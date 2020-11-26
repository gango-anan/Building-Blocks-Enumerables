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
  
end
