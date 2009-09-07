class Specialties < ActiveRecord::Migration
  def self.up
    create_table :specialties do |t|
      t.string :name, :null =>false

      t.timestamps
    end
    
    add_index(:specialties, :name, :unique => true)
  
    create_table :people_specialties, :id => false do |t|
      t.integer :specialty_id, :null => false
      t.integer :person_id, :null => false
    end
    
    add_index(:people_specialties, [:specialty_id, :person_id], :unique => true)
    add_index(:people_specialties, :person_id)
    
    add_foreign_key(:people_specialties, :specialty_id, :specialties, :id, :name => :fk_people_specialties_specialty_id)    
    add_foreign_key(:people_specialties, :person_id, :people, :id, :name => :fk_people_specialties_person_id)    
  
 end
        

  def self.down
    remove_foreign_key :people_specialties, :fk_people_specialties_specialty_id
    remove_foreign_key :people_specialties, :fk_people_specialties_person_id
    
    drop_table :people_specialties  
    drop_table :specialties
  end
end