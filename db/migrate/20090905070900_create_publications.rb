class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :name, :null =>false

      t.timestamps
    end
    
    add_index(:publications, :name, :unique => true)
  
 end
        

  def self.down
    drop_table :publications
  end
end