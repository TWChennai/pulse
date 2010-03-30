module ProjectHelper
  def convert_to_date(string_date)
    unless string_date.nil?
      return Date.parse(string_date)
    end
      return Date.today
  end
  def generate_check_box_tag(metric_name, mandatory="yes")
    if mandatory == "yes"
      check_box_tag "metrics[#{metric_name}]", "yes",true, :disabled =>true
    else
      check_box_tag "metrics[#{metric_name}]", "yes"
    end
  end
  def generate_form_tag_for_property(field_hash)
    if field_hash[1]["type"] == "date"
      date = convert_to_date(field_hash[1]["value"])
      date_select("properties[#{field_hash[0]}]", "date", :start_year => 1995,:order => [:day, :month, :year],
                  :default=>{:day => date.day, :year=>date.year, :month=>date.month})
    else
      text_field_tag "properties[#{field_hash[0]}]", field_hash[1]['value']
    end
  end
end
