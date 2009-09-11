class AddTitlesToPublishings < ActiveRecord::Migration
  def self.up
    add_column :publishings, :titles, :string
  end

  def self.down
    remove_column :publishings, :titles
  end
end
