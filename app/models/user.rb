# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  email              :string(255)      not null
#  encrypted_password :string(128)      not null
#  confirmation_token :string(128)
#  remember_token     :string(128)      not null
#  is_premium         :boolean
#

class User < ActiveRecord::Base
  include Clearance::User

  has_many :trackers

  after_initialize :init

  def init
    self.is_premium ||= true
  end
end
