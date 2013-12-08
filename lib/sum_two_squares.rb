def sum_2_sqs num
  prods=(0..1500).map{|x| x**2}.product((0..1500).map{|x| x**2})
  two_sqs=[]
  prods.each do |prod|
    two_sqs << prod if prod.inject(:+) == num
  end
  two_sqs.uniq{|x| x.sort}.map {|x| x.map{|y| Math.sqrt(y).to_i}}
end
