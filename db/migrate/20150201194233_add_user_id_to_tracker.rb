class AddUserIdToTracker < ActiveRecord::Migration
  def change
    change_table :trackers do |t|
      t.belongs_to :user, index: true
    end
  end
end
