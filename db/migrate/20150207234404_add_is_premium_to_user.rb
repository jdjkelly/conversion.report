class AddIsPremiumToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_premium, :boolean
  end
end
