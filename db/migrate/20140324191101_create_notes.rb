class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :study_session, index: true
      t.string :summary

      t.timestamps
    end
  end
end
