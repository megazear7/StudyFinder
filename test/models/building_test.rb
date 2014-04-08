require 'test_helper'

class BuildingTest < ActiveSupport::TestCase

  test "create basic, empty building" do
    building = FactoryGirl.build(:building)
    assert building.save
  end

  test "create building with rooms and a school" do
    building = FactoryGirl.build(:building_with_school_and_rooms)
    assert building.save
  end

end
