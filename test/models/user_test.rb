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

  test "user can level to level 10" do
    user = users(:one)
    assert_equal user.level, 1
    9.times do
      assert_difference -> { user.level } => 1 do
        user.exp = User.exp_needed_for_level_up(user.level)
        user.level_up
      end
    end
    assert_equal user.level, 10
    assert_difference -> { user.level } => 0 do
      user.exp = User.exp_needed_for_level_up(user.level)
      user.level_up
    end
  end
end
