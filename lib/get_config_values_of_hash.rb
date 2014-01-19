config = { :files => { :mode => {hex: {x: 0x777} } }, :name => "config" }
# config =  { :files=>{:mode=>1911}, :name=>"config" }

class Hash
  def get_value( default, *args )
    return default if args.empty? || self[args.first]==nil
    return self[args.first] if args.length == 1
    result = self.send(:values_at, args.first).first
    args.shift
    args.each do |arg|
      begin
        result=result.send(:values_at, arg).first
      rescue Exception
        return default
      end
    end
    result
  end
end

# ppl like w00t using fetch mixed with reduce
class Hash
  def get_value default, *args
    return default if args.empty?
    args.reduce(self) {|h, k| h.is_a?(Hash) ? h.fetch(k, default) : default }
  end
end

p config.get_value(0,:files,:mode,:hex,:x)



