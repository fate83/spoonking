class AddSandToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sand, :integer, default: 0, null: false
  end
end
