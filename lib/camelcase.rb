str="the-stealth-warrior"
str1="The_Stealth_Warrior"


def to_camel_case(str)
  str.gsub(/[-_](\w)/) { $1.upcase }
end

p to_camel_case str








