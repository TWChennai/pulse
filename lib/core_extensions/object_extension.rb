module ObjectExtension

  def nil_or
    return self unless self.nil?
    Class.new(BlankSlate) do
      def method_missing(sym, *args)
        nil
      end
    end.new
  end

end

Object.send :include, ObjectExtension
