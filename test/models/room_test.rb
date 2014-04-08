require 'test_helper'

class RoomTest < ActiveSupport::TestCase

  test "create basic, empty study session" do
    room = FactoryGirl.build(:room)
    assert room.save
  end

  test "create full study session" do
    room = FactoryGirl.build(:room_complete)
    assert room.save
  end

end
