class CreateBackpackItems < ActiveRecord::Migration[7.0]
  def change
    create_table :backpack_items do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :item, null: false, foreign_key: true
      t.integer :amount, default: 0

      t.timestamps
    end
  end
end
