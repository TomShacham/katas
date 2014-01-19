class Calculator
  def parse(string)    
    return string.to_i if string =~ /^\d+$/
    right, left = string.reverse.split(/\+|\-/, 2)
    right, left = string.reverse.split(/\/|\*/, 2) if left.nil?
    left, right = left.reverse, right.reverse
    {:left => parse(left), :right => parse(right), :op => string[left.size]}
  end

  def compute(tree)    
    return tree unless tree.is_a? Hash
    left, right, op = tree[:left], tree[:right], tree[:op]
    compute(left).send(op.to_sym, compute(right))
  end

  def evaluate(string)
    tree = parse(string.gsub(/\s/,''))    
    puts tree
    compute(tree)
  end
end
