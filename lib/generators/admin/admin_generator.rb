class AdminGenerator < Rails::Generator::NamedBase
# creates views, controller, migration and model for static admin data
	def manifest
		record do |m|
			m.class_collisions class_name
			
			m.template "controller_template.rb",
					        "app/controllers/#{file_name.pluralize}_controller.rb"
			
			m.template "model_template.rb",
				         "app/models/#{file_name}.rb"
					
			m.directory File.join('app/views', file_name.pluralize)
			
			m.template "index_template.html.erb",
		             "app/views/#{file_name.pluralize}/index.html.erb"
			
			m.template "edit_template.html.erb",
           			 "app/views/#{file_name.pluralize}/edit.html.erb"
      
      m.template "new_template.html.erb",
                 "app/views/#{file_name.pluralize}/new.html.erb"
                 
      m.migration_template "migration_template.rb", "db/migrate"  
      
      m.route_resources file_name.pluralize.downcase           
                 
      m.readme "POST_GENERATION_REMINDER"           
		end
	end
end