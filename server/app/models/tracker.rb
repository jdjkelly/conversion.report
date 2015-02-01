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
end
