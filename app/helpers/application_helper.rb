# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def button_tag(name, html_options = {})
    options = html_options.reverse_merge(:type => "button", :value => name)
    tag "input", options
  end

  def construct_widget(object, value)
    if object['type'] == 'select'
      send(object['type'] + "_tag", "risk[#{object['key']}]", (options_for_select(object['probable_values'], :selected => value)))
    elsif object['type'] == 'date'
      text_field_tag "risk[#{object['key']}]", value ? value : '', {:class => "datepicker"}
    elsif object['type'] == 'editable select'
      options = (object['probable_values'] << value).uniq
      select_tag("risk[#{object['key']}]", options_for_select(options, :selected => value), :onKeyPress=>"edit(event)")
    else
      send(object['type'] + "_tag", "risk[#{object['key']}]", value ? value :'', (object['probable_values'] ? options_for_select(object['probable_values'], :selected => value) : Hash.new))
    end
  end

  def risk_data_with_date(object, object_type)
    "#{object[object_type]} (#{object['date_modified']})"
  end
end
