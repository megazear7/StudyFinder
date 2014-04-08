require 'test_helper'

class NoteTest < ActiveSupport::TestCase

  test "create basic, empty study session" do
    note = FactoryGirl.build(:note)
    note.save
  end

  test "create full study session" do
    note = FactoryGirl.build(:note_complete)
    note.save
  end

end
