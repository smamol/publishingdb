class Awards < ActiveRecord::Migration
  def self.up
    create_table :awards do |t|
      t.string :name, :null =>false

      t.timestamps
    end
    
    add_index(:awards, :name, :unique => true)
  
    create_table :awards_people, :id => false do |t|
      t.integer :award_id, :null => false
      t.integer :person_id, :null => false
    end
    
    add_index(:awards_people, [:award_id, :person_id], :unique => true)
    add_index(:awards_people, :person_id)
    
    add_foreign_key(:awards_people, :award_id, :awards, :id, :name => :fk_awards_people_award_id)    
    add_foreign_key(:awards_people, :person_id, :people, :id, :name => :fk_awards_people_person_id)    
  
 end
        

  def self.down
    remove_foreign_key :awards_people, :fk_awards_people_award_id
    remove_foreign_key :awards_people, :fk_awards_people_person_id
    
    drop_table :awards_people
    drop_table :awards
  end
end