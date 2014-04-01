class AddUserIdToStudySessionsAndNotes < ActiveRecord::Migration
  def change
    add_column :study_sessions, :user_id, :integer
    add_column :notes, :user_id, :integer
  end
end
