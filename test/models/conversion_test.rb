# == Schema Information
#
# Table name: conversions
#
#  id         :integer          not null, primary key
#  user_agent :string(255)
#  host       :string(255)
#  browser    :string(255)
#  os         :string(255)
#  ip_address :string(255)
#  tracker_id :integer
#  created_at :datetime
#  updated_at :datetime
#  country    :string(255)
#

require 'test_helper'

class ConversionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
