class Person < ActiveRecord::Base
  require_dependency "search"
  searches_on :first_name, :last_name
  
  has_and_belongs_to_many :awards
  has_many :publications, :through => :publishings, :uniq => true 
  has_many :publishings, :dependent => :delete_all  
  belongs_to :occupation
  has_and_belongs_to_many :specialties
  
  validates_presence_of :last_name
  validates_uniqueness_of :last_name, :scope => [:first_name] 
  validates_format_of :email, :with => /(\S+)@(\S+)/, :allow_blank => true
  validates_uniqueness_of :last_name, :scope => :first_name, :case_sensitive => false, :message => "and first name combination must be unique"
  
  after_update :save_publishings
  
  attr_accessor :should_destroy
  
  def first_name_and_last_name
    [first_name, last_name].compact.join(' ')
  end
  
  def self.search_people_by_name(searchstring)
    self.search(searchstring, :order => "people.last_name", :include => [:occupation, :awards, :specialties])
  end 
  
  def self.filter_person_by_occupation_publishings(occupation_id, publication_id) 
     scope = Person.scoped({:order => :last_name, :include => [:occupation, :awards, :specialties]})
     scope = scope.scoped :conditions => [ "occupation_id = ?", occupation_id] unless occupation_id == 'All'
     scope = scope.scoped :joins => :publishings, :conditions => [ "publication_id = ?", publication_id] unless publication_id == 'All'     
     scope
   end
   
  
  
  
  def publishing_attributes=(publishing_attributes)
    publishing_attributes.each do |attributes|
      if attributes[:id].blank?
        publishings.build(attributes)
      else
        publishing = publishings.detect { |c| c.id == attributes[:id].to_i}
        publishing.id = attributes[:id]
        attributes.delete("id")
        publishing.attributes = attributes
      end
    end
  end

   def save_publishings
     publishings.each do |c|
       if c.should_destroy?
         c.destroy
       else
         c.save(false)
       end
     end
   end

   def should_destroy?
     should_destroy.to_i == 1
   end
  
end
