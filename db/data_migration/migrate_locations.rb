Project.all.each do |project|
	unless project.properties['location'].nil?
		project.location = project.properties['location'] 
		project.properties.delete(:location)
		project.save
	end
end