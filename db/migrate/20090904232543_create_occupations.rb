class CreateOccupations < ActiveRecord::Migration
  def self.up
    create_table :occupations, :force => true do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    add_index(:occupations, [:name], :unique => true)
    
    change_table :people do |t|
      t.integer :occupation_id      
    end
    
    add_foreign_key(:people, :occupation_id, :occupations, :id, :name => :fk_people_occupations_occupation_id)    
        
    add_index :people, :occupation_id
  end

  def self.down
    remove_foreign_key :people, :fk_people_occupations_occupation_id
    
    remove_column :people, :occupation_id 
    
    drop_table :occupations
  end
end
