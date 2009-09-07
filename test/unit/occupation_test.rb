require 'test_helper'

class OccupationTest < ActiveSupport::TestCase
  test "invalid_without_name" do
    occupation = Occupation.new
    assert !occupation.valid?
  end
  
  test "valid_with_name" do
    occupation = Occupation.new(:name => "Sandy Occupation")
    assert occupation.valid?
  end
end
