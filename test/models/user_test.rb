require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should save users that have all the correct information" do
    user = FactoryGirl.build(:complete_user)
    assert user.save
  end

  test "should not save a user without school" do
    user = FactoryGirl.build(:user_without_school)
    assert !user.save, "Saved the user without a school"
  end

end
