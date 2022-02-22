require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "can't delete item if in backpack" do
    item = items(:one)
    assert_not item.destroy
    assert_includes item.errors[:base], "Can't delete item. Still in someone's backpack."
  end
end
