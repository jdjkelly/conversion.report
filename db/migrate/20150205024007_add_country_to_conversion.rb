class AddCountryToConversion < ActiveRecord::Migration
  def change
    add_column :conversions, :country, :string
  end
end
