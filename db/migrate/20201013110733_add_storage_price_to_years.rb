class AddStoragePriceToYears < ActiveRecord::Migration[6.0]
  def change
    add_column :years, :tier_1_storage_price, :float
    add_column :years, :tier_2_storage_price, :float
    add_column :years, :tier_3_storage_price, :float
    add_column :years, :tier_4_storage_price, :float
    add_column :years, :tier_5_storage_price, :float
  end
end
