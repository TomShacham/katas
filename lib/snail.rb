def snail array
  snail = array.shift
  until array.empty?
    array.each{|x| snail << x.pop}
    snail << array.pop.reverse
    back=[]
    array.each{|x| back << x.shift}
    snail << back.reverse
    snail << array.shift
  end
  snail.flatten.compact
end

#best answers
def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end

array=  [[1, 2, 3, 4, 5, 6 ],
         [7, 8, 9, 10,11,12],
         [13,14,15,16,17,18],
         [19,20,21,22,23,24],
         [25,26,27,28,29,30],
         [31,32,33,34,35,36] ]


