module ProjectHelper
  def generate_check_box_tag(metric)
    if metric.mandatory
      check_box_tag "project[metrics[#{metric.key}]]", "yes", true, :disabled =>true
    else
      check_box_tag "project[metrics[#{metric.key}]]", "yes", @project.metrics.include?(metric.key)
    end
  end

  def generate_form_tag_for_property(property, form)
    options = {}
    options[:class] = "datepicker" if property.type == "date"
    text_field_tag "project[properties[#{property.key}]]", @project.properties[property.key], options
  end  

  def show_project_status
    @project.isAlive ? "Open": "Closed"
  end
  def change_status_link
    if @project.isAlive
      link_to "Close Project", close_project_path(@project.id), :confirm => "Are you Sure?"
    else
      link_to "Reopen Project", reopen_project_path(@project.id), :confirm => "Are you Sure?"
    end
  end
end