class AddTotalAmountPerYearAndTotalAmount < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :total_new_price_2015, :float
    add_column :companies, :total_kwh_2015, :integer
    add_column :companies, :total_new_price_2016, :float
    add_column :companies, :total_kwh_2016, :integer
    add_column :companies, :total_new_price_2017, :float
    add_column :companies, :total_kwh_2017, :integer
    add_column :companies, :total_new_price_2018, :float
    add_column :companies, :total_kwh_2018, :integer
    add_column :companies, :total_new_price_2019, :float
    add_column :companies, :total_kwh_2019, :integer
    add_column :companies, :total_new_price, :float
    add_column :companies, :total_kwh, :integer
    add_column :companies, :total_old_price_2015, :float
    add_column :companies, :total_old_price_2016, :float
    add_column :companies, :total_old_price_2017, :float
    add_column :companies, :total_old_price_2018, :float
    add_column :companies, :total_old_price_2019, :float
    add_column :companies, :total_old_price, :float
  end
end
