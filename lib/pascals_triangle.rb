def pascalsTriangle(n)
  flat_array = [[1],[1,1]]
  i = 2
  until i >= n
    flat_array << next_level_down(flat_array.last)
    i += 1
  end
  flat_array.flatten
end

def next_level_down array
  next_level = array.inject([]) do |next_level, element|
      next_level << array[next_level.length, 2].inject(:+)
    end
  next_level[0..-2].unshift(1).push(1)
end

p pascalsTriangle(100)
