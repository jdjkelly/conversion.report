class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.string :name

      t.timestamps
    end
  end
end
