require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user gains experience" do
    user = users(:one)
    exp  = 123
    assert_changes -> { user.exp }, from: 0, to: exp do
      user.gain_exp exp
    end
  end

  test "user level up" do
    user = users(:one)
    user.gain_exp user.exp_for_level_up
    assert user.can_level_up?
  end
end
