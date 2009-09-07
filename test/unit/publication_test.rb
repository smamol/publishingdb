require 'test_helper'

class PublicationTest < ActiveSupport::TestCase
  test "invalid_without_name" do
    publication = Publication.new
    assert !publication.valid?
  end
  
  test "valid_with_name" do
    publication = Publication.new(:name => "Sandy Publication")
    assert publication.valid?
  end
end
