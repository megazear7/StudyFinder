require 'test_helper'

class SchoolTest < ActiveSupport::TestCase

  test "Save a basic, empty school" do
    school = FactoryGirl.build(:school)
    school.save
  end

  test "Save a school with buildings" do
    school = FactoryGirl.build(:school_with_buildings)
    school.save
  end
  
end
