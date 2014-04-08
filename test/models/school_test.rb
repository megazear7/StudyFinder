require 'test_helper'

class SchoolTest < ActiveSupport::TestCase

  test "Save a basic, empty school" do
    school = FactoryGirl.build(:school)
    assert school.save
  end

  test "Save a school with buildings" do
    school = FactoryGirl.build(:school_with_buildings)
    assert school.save
  end
  
end
