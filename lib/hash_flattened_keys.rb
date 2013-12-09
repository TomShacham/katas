
def pass_most_nested_array hash
  return hash unless hash.values.any? {|value| value.is_a? Hash }
  hash.values.select{ |val| val.is_a? Hash }.each do |hash_value|
    pass_most_nested_array hash_value
  end
end

unflat = {
  id: 1,
  info: {
    more_info: {
      count: 1
    },
    name: {
      :second_name => 'example'}
  }
}


def flattened_keys hash
  return hash if hash.values.none? {|v| v.is_a? Hash}
  new_hash = {}
  new_hash = hash.clone
  hash.each do |key, value|
    if value.respond_to? :keys
      value.each do |nested_key, nested_value|
        new_hash.delete key
        new_hash[[key, nested_key].join("_").to_sym]=nested_value
      end
    end
  end
  flattened_keys(new_hash)
end

# p flattened_keys unflat
test3= {:a=>1, :b_c =>2, :b => {:d=>3}, :b => {"e" => {"f" => nil}}}
# p "test 3 is #{test3}"


class Hash
  def flattened_keys
    return self if self.values.none? {|v| v.is_a? Hash}
    new_hash = {}
    new_hash = self.clone
    self.each do |key, value|
      if value.is_a? Hash
        value.each do |nested_key, nested_value|
          new_hash.delete key
          new_key = [key, nested_key].join("_")
          new_key = nested_key.is_a?(String) ? new_key : new_key.to_sym
          new_hash[new_key]=nested_value
        end
      end
    end
    new_hash.flattened_keys
  end
end

p test3.flattened_keys

