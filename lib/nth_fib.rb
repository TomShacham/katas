def nth_fibonacci(n)
  fibs = Enumerator.new do |y|
    i,j=0,1
    loop do
      y << i
      i,j=j,i+j
    end
  end

  fibs.take(n-1).last
end

p nth_fibonacci