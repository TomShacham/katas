def solution(pairs)
  (pairs.keys.zip pairs.values).map{|pair| pair.join ' = '}.join','
end