class SuperSimpleAuthenticationGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions class_name
      
      m.template "app/controllers/controller_template.rb",
                 "app/controllers/#{file_name}_controller.rb"
      
      m.template "config/super_simple_authentication.yml",
                 "config/super_simple_authentication.yml"
                 
      m.template "lib/super_simple_authentication_system.rb",
                 "lib/super_simple_authentication_system.rb"
                 
      m.directory File.join('app/views', file_name)
      m.template "app/views/new_session.rhtml",
                 "app/views/#{file_name}/new.rhtml"
              
      m.route_resources table_name
    end
  end
end
