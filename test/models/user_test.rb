require 'test_helper'

class TrackerTest < ActiveSupport::TestCase
  test "all users should be premium" do
    assert_equal(true, User.new.is_premium?)
  end
end
