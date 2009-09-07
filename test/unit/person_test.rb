require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "invalid_without_data" do
    person = Person.new
    assert !person.valid?
  end
  
  test "invalid_without_last_name" do
    person = Person.new(:first_name => "sandy", :phone_or_skype => "smamol")
    assert !person.valid?
  end
  
  test "valid_persoon" do
    person = Person.new(:first_name => "sandy", :last_name => "bandy", :phone_or_skype => "smamol")
    assert person.valid?
  end
  
  
  test "invalid_with_wrong_email" do
    person = Person.new(:first_name => "first", :last_name => "last", :email => "smamol")
    assert !person.valid?
  end
   
  test "invalid_with_duplicate_name" do
    person = Person.new(:first_name => "Sandy", :last_name => "Mamoli")
    assert !person.valid?
  end
  
  test "valid_with_occupation" do
    person = Person.new(:first_name => "Sandy", :last_name => "Berger", :occupation_id => :one)
    assert person.valid?
  end
  
end
