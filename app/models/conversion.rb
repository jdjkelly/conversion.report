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

class Conversion < ActiveRecord::Base
  belongs_to :tracker

  before_validation :parse_user_agent, on: :create, if: -> { self.user_agent.present? }
  before_validation :geocode, if: -> { self.ip_address.present? }

  validates_presence_of :tracker_id

  private

  def parse_user_agent
    ua           = UserAgent.parse(user_agent)
    self.os      = ua.platform
    self.browser = ua.browser
  end

  def geocode
    self.country = Geocoder.search(self.ip_address).last.data["country_name"]
  end
end
