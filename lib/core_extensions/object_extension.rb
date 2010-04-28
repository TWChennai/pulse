module ObjectExtension

  def nil_or
    return self unless self.nil?
    Class.new(BlankSlate) do
      def method_missing(sym, *args)
        nil
      end
    end.new
  end
  
  def to_bool
    if self == "true"
      return true
    elsif self == "false"
      return false
    else
      raise ArgumentError
    end
    
  end

end

Object.send :include, ObjectExtension
