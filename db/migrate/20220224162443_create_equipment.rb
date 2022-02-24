class CreateEquipment < ActiveRecord::Migration[7.0]
  def change
    create_table :equipment do |t|
      t.string :name, default: "Löffel"
      t.integer :level, default: 1
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
