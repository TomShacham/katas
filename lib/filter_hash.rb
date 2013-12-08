def check_ages?(data, sex, age_is_greater_than)
  !(data.select{|hsh| hsh[:sex] == sex}.map{|hsh| hsh[:age] > age_is_greater_than}).include? false
end


data = [
  {age: 40, sex: :m},
  {age: 24, sex: :f},
  {age: 56, sex: :m},
  {age: 45, sex: :m},
  {age: 23, sex: :f}
]

p check_ages? data, :m, 40