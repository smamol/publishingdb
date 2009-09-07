class <%= class_name.pluralize %> < ActiveRecord::Migration
  def self.up
    create_table :<%= class_name.pluralize.downcase %> do |t|
      t.string :name, :null =>false

      t.timestamps
    end
    
    add_index(:<%= class_name.pluralize.downcase %>, :name, :unique => true)
  
    change_table :titles do|t|
      t.references(:<%= class_name.downcase %>)
    end
    
    add_foreign_key(:titles, :<%= class_name.downcase %>_id, :<%= class_name.pluralize.downcase %>, :id, :name => :fk_titles_<%= class_name.pluralize.downcase %>)
    add_index(:titles, :<%= class_name.downcase %>_id)    
 end
        

  def self.down
    remove_foreign_key :titles, :fk_titles_<%= class_name.pluralize.downcase %>

    change_table :titles do |t|
      t.remove_references
    end
    
    remove_column(:titles, :<%= class_name.downcase %>_id)
    
    drop_table :<%= class_name.pluralize.downcase %>
  end
end