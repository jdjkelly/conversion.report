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

class Tracker < ActiveRecord::Base
  has_many :conversions

  belongs_to :user

  validates_presence_of :user, :name, :tracking_id

  before_validation :build_tracking_id, on: :create

  private

  # Assigns a tracking_id if not present (i.e. creation). This key is designed to be reasonably
  # unique within our system. Should the system scale beyond its current market, this would need
  # to change so that we could reliably guarantee uniqueness. At the moment, it's reasonably
  # expected to be unique.
  #
  # @returns [string]
  def build_tracking_id
    self.tracking_id ||= SecureRandom.base64(6)
  end

end
