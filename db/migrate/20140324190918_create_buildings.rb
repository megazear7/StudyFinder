class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.references :school, index: true
      t.string :name

      t.timestamps
    end
  end
end
