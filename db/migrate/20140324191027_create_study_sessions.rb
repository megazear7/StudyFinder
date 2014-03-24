class CreateStudySessions < ActiveRecord::Migration
  def change
    create_table :study_sessions do |t|
      t.references :room, index: true
      t.string :name
      t.string :summary
      t.datetime :date
      t.time :time

      t.timestamps
    end
  end
end
