class AddSubjectToStudySessions < ActiveRecord::Migration
  def change
    add_column :study_sessions, :subject, :string
  end
end
