class AddPublishingrolesData < ActiveRecord::Migration
    def self.up
        Publishingrole.create(:name => 'Staff')
        Publishingrole.create(:name => 'Contributor')
    end

    def self.down
        Publishingrole.delete_all
    end
  end