#my solution
def prime(n)
  primes=[2,3,5,7]
  until primes.last >= n
    nums=Array(primes.last..primes.last*2)
    primes.each do |pr|
      nums.select! {|num| num%pr !=0}
    end
    primes << nums
    primes.flatten!
  end
  primes.select{|pr| pr <= n}
end

p prime(22)

#best solution
def prime(n)
  list = (2..n).to_a
  list.each{ |i| list.reject!{ |j| j > i && j % i == 0 } }
end

p prime(6)