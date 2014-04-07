class AddDateTimeToStudySessions < ActiveRecord::Migration
  def change
    add_column :study_sessions, :meeting_time, :datetime
  end
end
