class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.string :user_agent
      t.string :host
      t.string :browser
      t.string :os
      t.string :ip_address
      t.belongs_to :tracker, index: true

      t.timestamps
    end
  end
end
