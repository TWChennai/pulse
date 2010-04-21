module TimeExtension
  def last_friday
    if self.wday == 5 #If its friday
      return self.strftime("%m/%d/%Y") 
    elsif self > Time.now
      return (self.end_of_week - 2.days).strftime("%m/%d/%Y")
    elsif self < Time.now
      return (self.end_of_week - 2.days).strftime("%m/%d/%Y")
    end
  end
end

Time.send :include, TimeExtension