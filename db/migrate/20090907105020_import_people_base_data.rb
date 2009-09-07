require 'fastercsv'

class ImportPeopleBaseData < ActiveRecord::Migration
  def self.up
    FasterCSV.foreach("#{RAILS_ROOT}/db/migrate/fixtures/people_base.csv", :row_sep => "\r") do |row|
         name, lastname, email, mobile, phone, website, notes, occupation = row
    Person.create(:first_name => name, :last_name => lastname, :email => email, :mobile => mobile, :phone_or_skype => phone, 
                  :website => website, :notes => notes, :occupation_id => occupation)
    end
  end

  def self.down
  end
end
