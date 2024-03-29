require 'test_helper'

class StudySessionTest < ActiveSupport::TestCase

  test "create basic, empty study session" do
    study_session = FactoryGirl.build(:study_session)
    assert study_session.save
  end

  test "create full study session" do
    study_session = FactoryGirl.build(:study_session_complete)
    assert study_session.save
  end

end
