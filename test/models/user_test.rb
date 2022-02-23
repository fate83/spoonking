require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user gains experience" do
    user = users(:one)
    exp  = 123
    assert_changes -> { user.exp }, from: 0, to: exp do
      user.gain_exp exp
    end
  end
end
