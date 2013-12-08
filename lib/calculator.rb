class Calculator
  def evaluate(string)

  end
end

string = "2 + 2 + 1 - 1 - 1 + 3 * 4 - 5 * 5 / 2 / 4 - 6"

def parse(string)
  tree ||= {}
  operator='\-'
  looking_for = string[/\d* #{operator} \d*/]
  return string if looking_for.nil?
  left = string.slice(0..string.index(/#{operator}/)-2)
  right = string.slice(string.index(/#{operator}/)+2..-1)
  tree[:op]=operator[1].intern
  tree[:left]=parse(left)
  tree[:right]=parse(right)

end

p split_by_minus = parse(string)

# p treeify split_by_minus
string = "2 + 2 + 1 - 1 - 1 + 3 * 4 - 5 * 5 / 2 / 4 - 6"







