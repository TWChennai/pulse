# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def button_tag(name, html_options = {})
    options = html_options.reverse_merge(:type => "button", :value => name)
    tag "input", options
  end
end
