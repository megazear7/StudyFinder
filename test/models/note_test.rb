require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test "create basic, empty study session" do
    note = FactoryGirl.build(:note)
    assert note.save
  end

  test "create full study session" do
    note = FactoryGirl.build(:note_complete)
    assert note.save
  end

end
