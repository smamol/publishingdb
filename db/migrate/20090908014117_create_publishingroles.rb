class CreatePublishingroles < ActiveRecord::Migration
  
  def self.up
    create_table :publishingroles do |t|
      t.string :name, :null =>false

      t.timestamps
    end
    
    add_index(:publishingroles, :name, :unique => true)
  
    change_table :publishings do|t|
      t.references(:publishingrole)
    end
    
    add_foreign_key(:publishings, :publishingrole_id, :publishingroles, :id, :name => :fk_publishings_publishingroles_publishingrole_id)
    add_index(:publishings, :publishingrole_id)    
 end
        

  def self.down
    remove_foreign_key :publishings, :fk_publishings_publishingroles_publishingrole_id

    change_table :publishings do |t|
      t.remove_references
    end
    
    remove_column(:publishings, :publishingrole_id)
    
    drop_table :publishingroles
  end
end
