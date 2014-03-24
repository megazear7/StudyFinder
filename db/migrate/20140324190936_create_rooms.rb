class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :building, index: true
      t.string :room_number

      t.timestamps
    end
  end
end
