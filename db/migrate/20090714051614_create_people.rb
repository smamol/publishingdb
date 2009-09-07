class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :email
      t.string :mobile
      t.string :phone_or_skype
      t.string :website
      t.text :notes

      t.timestamps
    end
    
    add_index(:people, [:first_name, :last_name], :unique => true)
    add_index(:people, [:last_name, :first_name], :unique => true)
    
  end

  def self.down
    drop_table :people
  end
end
