def loop &block
  block.call while true
end

# Extend the Hash class with a flattened_keys method
class Hash
  def flattened_keys
  return self unless self.values.any? {|x| x.class==Hash}
  self
  hsh={}
  self.each {|k,v| hsh[(k.to_s + "_" + v.flatten.first.to_s).to_sym] = v.flatten.last if v.class == Hash;  hsh[k]=v unless v.class==Hash}
  return hsh unless hsh.values.any?{|x| x.class == Hash}
    loop do
      hsh_new=Hash.new
      hsh.each do |k,v|
        if v.class == Hash
          v.each do |val|
            hsh_new[(k.to_s + "_" + val.flatten.to_s).to_sym] = val.flatten.last
          end
        else
          hsh_new[k]=v
        end
      end
      return hsh_new unless hsh_new.values.any?{|x| x.class == Hash}
      hsh=hsh_new
    end
  end
end

unflat = {
  id: 1,
  info: {
    name: 'example',
    more_info: {
      count: 1
    }
  }
}

p unflat.flattened_keys
