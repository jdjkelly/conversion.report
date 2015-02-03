# == Schema Information
#
# Table name: trackers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Tracker < ActiveRecord::Base
  has_many :conversions

  belongs_to :user

  validates_presence_of :user

  # Return the rate of conversions per day, rounded
  def conversions_per_day
    conversions.group_by do |conversion|
      conversion.created_at.beginning_of_day
    end.map do |conversion|
      conversion[1].count
    end.sum.to_f
  end
end
