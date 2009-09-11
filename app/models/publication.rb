class Publication < ActiveRecord::Base
  require_dependency "search"
  searches_on :name
  
  has_many :publishings
  has_many :people, :through => :publishings, :uniq => true

  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.search_publication_by_name(searchstring)
    self.search(searchstring, :order => "publications.name" )
  end
  
end
