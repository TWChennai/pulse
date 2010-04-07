module ArrayExtension
  def select!(&block)
    elements_to_keep = select(&block)
    (self - elements_to_keep).each {|elem_to_remove| delete(elem_to_remove)}
    self
  end
end

Array.send :include, ArrayExtension