number = '283910'

#my solution

two_digits = number.to_s.split('')
  two_digs = (0...two_digits.length).inject([]) do |two_digs, digit|
    two_digs << two_digits[digit,5]
  end
two_digs.pop
p two_digs.map!(&:join).map!(&:to_i).max

#cool solution
p number.chars.each_cons(5).map(&:join).map(&:to_i).max


var=[1,2,3,4,5,6]

trials = 2
