str = "apples, pears # and bananas\ngrapes\nbananas !apples"

def solution(input, markers)
  markers.map! {|m| ['$', '^', '(', ')'].include?(m) ? '\\'+m : m }
  markers.each do |marker|
    input.gsub!(/\s*#{marker}.*/,"")
  end
  input
end

p solution(str,["#","!"])

 p 'apples, pears grapes bananas' == 'apples, pears grapes bananas'