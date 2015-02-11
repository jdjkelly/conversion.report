class AddTrackingIdToTrackers < ActiveRecord::Migration
  def change
    add_column :trackers, :tracking_id, :string
  end
end
