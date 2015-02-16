# == Schema Information
#
# Table name: trackers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#  tracking_id :string(255)
#

require 'test_helper'

class TrackerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
