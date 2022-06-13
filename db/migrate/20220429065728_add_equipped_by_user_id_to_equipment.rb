class AddEquippedByUserIdToEquipment < ActiveRecord::Migration[7.0]
  def up
    add_column :equipment, :worn_by_user_id, :integer, null: true, default: nil
    puts User.all
    User.all.each do |u|
      u.equipment = u.equipments.first
      u.save!
    end
  end

  def down
    remove_column :equipment, :worn_by_user_id, :integer, null: true, default: nil
  end
end
