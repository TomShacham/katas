
def title_case title, minor_words=''
  title.capitalize.split.map{|a| minor_words.downcase.split.include?(a) ? a : a.capitalize }.join ' '
end

title='the taming of the shrew'
minor_words = 'of the'

p title_case title, minor_words