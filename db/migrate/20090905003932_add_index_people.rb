class AddIndexPeople < ActiveRecord::Migration
  def self.up
    add_index(:people, [:id, :occupation_id], :unique => true)
  end

  def self.down
    remove_index :people, [:id, :occupation_id]
  end
end
