class RomanNumerals
  def self.to_roman num
    str=[]
    divisors=[1000,500,100,50,10,5]
    letters=["M","D","C","L","X","V"]
    divisors.each_with_index {|div,i| (num/div).times {str << letters[i]}; num=num%div }
    num.times {str << 'I'}
    str=str.join
    str.gsub!(/C{4}/,"CD")
    str.gsub!(/X{4}/,"XL")
    str.gsub!(/I{4}/,"IV")
    str.gsub!(/DCD/,"CM")
    str.gsub!(/LXL/,"XC")
    str
  end

  def self.from_roman roman
    letters=["M","D","C","L","X","V","I"]
    divisors=[1000,500,100,50,10,5,1]
    value=0
    roman.gsub!(/XL/,"XXXX")
    roman.gsub!(/IV/,"IIII")
    roman.gsub!(/CD/,"CCCC")
    letters.each_with_index {|letr,i| roman.scan(/#{letr}/).length.times {value+=divisors[i]} }
    value
  end
end

p RomanNumerals.to_roman 2145
p RomanNumerals.from_roman "MCDXLIV"