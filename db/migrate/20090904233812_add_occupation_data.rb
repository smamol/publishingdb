class AddOccupationData < ActiveRecord::Migration
  def self.up
      Occupation.create(:name => 'Author')
      Occupation.create(:name => 'Photographer')
      Occupation.create(:name => 'Graphic Artist')      
  end

  def self.down
      Occupation.delete_all
  end
end
