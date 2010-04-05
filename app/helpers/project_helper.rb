module ProjectHelper
  def convert_to_date(string_date)
    unless string_date.nil?
      return Date.parse(string_date)
    end
      return Date.today
  end
  def generate_check_box_tag(metric)
    if metric.mandatory == "yes"
      check_box_tag "metrics[#{metric}]", "yes",true, :disabled =>true
    else
      check_box_tag "metrics[#{metric}]", "yes"
    end
  end
  def generate_form_tag_for_property(field_hash)
    if field_hash.type == "date"
      date = convert_to_date(field_hash.value)
      date_select("properties[#{field_hash}]", "date", :start_year => 1995,:order => [:day, :month, :year],
                  :default=>{:day => date.day, :year=>date.year, :month=>date.month})
    else
      text_field_tag "properties[#{field_hash}]", field_hash.value
    end
  end
end
