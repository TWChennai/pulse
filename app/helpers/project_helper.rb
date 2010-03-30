module ProjectHelper
  def convert_to_date(string_date)
    unless string_date.nil?
      return Date.parse(string_date)
    end
      return Date.today
  end
end
