require "test_helper"

class EquipmentTest < ActiveSupport::TestCase
  test "upgrade equipment" do
    equipment = equipment(:one)
    equipment.user.update(sand: Equipment.sand_needed_for_equipment(equipment.level))
    assert equipment.can_upgrade?
  end

  test "can upgrade 10 times" do
    equipment = equipment(:one)
    assert_changes -> { equipment.level }, from: 1, to: 10 do
      9.times do
        equipment.user.update(sand: Equipment.sand_needed_for_equipment(equipment.level))
        equipment.upgrade!
      end
    end

    assert_difference -> { equipment.level } => 0 do
      equipment.user.update(sand: Equipment.sand_needed_for_equipment(equipment.level))
      equipment.upgrade!
    end
  end
end
