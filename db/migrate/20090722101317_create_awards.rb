class CreateAwards < ActiveRecord::Migration
    def self.up
      Award.create(:name => 'Qantas 2009')
      Award.create(:name => 'Qantas 2010')
    end

    def self.down
      Award.delete_all
    end
  end