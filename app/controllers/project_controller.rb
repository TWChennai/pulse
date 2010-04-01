class ProjectController < ApplicationController
  def show 
    @project = Project.find(params[:id])
    
    @project_properties = @project["properties"].sort{ |a,b| a[1]["order"] <=> b[1]["order"] }
    @project_metrics = @project["metrics"].sort{ |a,b| a[1]["metadata"]["order"] <=> b[1]["metadata"]["order"] }
    @metrics_list = []
    @project_metrics.each do |group|
      group[1]["data"].each do |metric|
        if metric[1]["tracked"] == "yes"
          @metrics_list << metric
        end
      end
    end
    @title = "Showing Project Info for#{@project["properties"]["name"]["value"]}"
  rescue StandardError => e
    render :template => 'public/404.html'
  end

  def new
    @title = "New Project Page"
    @project_template = Project.project_template
    @fields = @project_template["tracking"]["properties"].sort{|a,b| a[1]["order"]<=>b[1]["order"]}
    @metrics = @project_template["tracking"]["metrics"].sort{|a,b| a[1]["metadata"]["order"] <=> b[1]["metadata"]["order"]}
  end

  def edit
    @project = Project.find(params[:id])
    @fields = @project["properties"].sort{|a,b| a[1]["order"]<=>b[1]["order"]}
    @metrics = @project["metrics"].sort{|a,b| 
      a[1]["metadata"]["order"] <=> b[1]["metadata"]["order"]
    }
  rescue
    render :template=>'public/404.html'
  end

  def save
    @project_template = Project.project_template
    @tracked_properties = @project_template["tracking"]["properties"]
    @tracked_metrics = @project_template["tracking"]["metrics"]
    @project = Project.new
    @response_from_server = @project.save({:metrics =>get_converted_metrics(@tracked_metrics,params[:metrics])  , :properties => get_converted_properties(@tracked_properties,params[:properties])})
    @id = @response_from_server["id"]
    redirect_to(:action=>'show',:id=>@id)
  end

  def update
    @project=Project.find(params[:project][:id])
    @tracked_properties=@project["properties"]
    @id = params[:project][:id]
    @project["properties"] = get_converted_properties(@tracked_properties,params[:properties])
    @project.save
    redirect_to(:action=>'show', :id=>@id)
  rescue
    render :template=>'public/404.html'
  end

  private
  def get_converted_metrics(metrics,metrics_tracked)
    metrics.each do |metric_group|
      metric_group[1]["data"].each do |metric|
        if metrics_tracked.has_key?(metric[0])
          metric[1]["tracked"] = "yes"
        end
      end
    end
    return metrics
  end

  def get_converted_properties(tracked_properties, properties)
    hash_to_save=construct_date_json(tracked_properties,properties)
    tracked_properties.each do |tracked_property| 
      tracked_properties[tracked_property[0]]["value"] = hash_to_save[tracked_property[0]] 
    end
    return tracked_properties
  end

  def construct_date_json(tracked_properties, actual_properties )
    tracked_properties.each do |property|
      if property[1]["type"] == "date"
        actual_properties[property[0]]= get_date_from_hash(actual_properties[property[0]])
      end
    end
    return actual_properties
  end

  def get_date_from_hash(date_hash)
    return Date.civil(date_hash["date(1i)"].to_i,date_hash["date(2i)"].to_i,date_hash["date(3i)"].to_i)
  end
end
