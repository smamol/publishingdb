class Publishing < ActiveRecord::Base
  
  validates_presence_of :publication_id, 
                        :message => "Please choose a publication"

  
  belongs_to :person
  belongs_to :publication
  
  attr_accessor :should_destroy
    
  def should_destroy?
    should_destroy.to_i == 1
  end
end