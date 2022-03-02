class AddEfficiencyToEquipment < ActiveRecord::Migration[7.0]
  def change
    add_column :equipment, :efficiency, :decimal, precision: 5, scale: 2, default: 1.00
  end
end
