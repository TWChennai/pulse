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
    @project_template = ProjectTemplate.project_template
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
    @project = Project.new(params.slice("properties", "metrics").merge(:name => "default"))
    @project.save
    redirect_to(show_project_path(@project.id))
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
end
