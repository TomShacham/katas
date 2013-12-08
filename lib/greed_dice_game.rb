dice =[2,2,2,3,3]
#my soln
def score( dice )
  return 0 if dice.empty? || dice.any? {|x| x.nil?}
  roll = [1,6,5,4,3,2]
  vals = [1000,600,500,400,300,200]
  value = 0
  roll.each_with_index do |roll,i|
  dice = dice.split if dice.class == String
    if dice.sort.join.gsub!(/#{roll}{3}/,"")
      value+=vals[i]
      dice=dice.sort.join.gsub!(/#{roll}{3}/,"")
    end
  end
  return 0 if dice.length == 5 && (!dice.include?(5) || !dice.include?(1))
  dice = dice.join if dice.class == Array
  dice.scan(/5/).each {|fve| value+=50}
  dice.scan(/1/).each {|one| value+=100}
  value
end

#my fave soln
SCORE_MAP = {
  1 => [0, 100, 200, 1000, 1100, 1200, 2000],
  2 => [0, 0, 0, 200, 200, 200, 400],
  3 => [0, 0, 0, 300, 300, 300, 600],
  4 => [0, 0, 0, 400, 400, 400, 800],
  5 => [0, 50, 100, 500, 550, 600, 1000],
  6 => [0, 0, 0, 600, 600, 600, 1200]
}

def score( dice )
  (1..6).inject(0) do |score, die|
    score += SCORE_MAP[die][dice.count(die)]
  end
end
p score (dice)