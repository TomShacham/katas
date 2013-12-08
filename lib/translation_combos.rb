words = {
  life:   %w{ vida vie Leben },
  death:  %w{ muerte mort Tode }
}

Hash[words.map { |k,v|
    [k, v.sort.repeated_combination(v.size).map(&:uniq).uniq.sort]
  }]


def possibilities(words)
  words.reduce({}) {|result, (word, translations) | result[word] = permute(translations); result }
end

def permute(list)
  (1..list.size).reduce([]) {|result, size| list.combination(size).map(&:sort) + result}.sort
end

p permute(%w[vini vidi vici])