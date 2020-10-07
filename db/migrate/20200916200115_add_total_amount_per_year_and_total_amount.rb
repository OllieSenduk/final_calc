class AddTotalAmountPerYearAndTotalAmount < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :total_new_price_2015, :float
    add_column :companies, :total_new_kwh_2015, :float
    add_column :companies, :total_new_price_2016, :float
    add_column :companies, :total_new_kwh_2016, :float
    add_column :companies, :total_new_price_2017, :float
    add_column :companies, :total_new_kwh_2017, :float
    add_column :companies, :total_new_price_2018, :float
    add_column :companies, :total_new_kwh_2018, :float
    add_column :companies, :total_new_price_2019, :float
    add_column :companies, :total_new_kwh_2019, :float
    add_column :companies, :total_new_price, :float
    add_column :companies, :total_new_kwh, :float
    add_column :companies, :total_old_price_2015, :float
    add_column :companies, :total_old_kwh_2015, :float
    add_column :companies, :total_old_price_2016, :float
    add_column :companies, :total_old_kwh_2016, :float
    add_column :companies, :total_old_price_2017, :float
    add_column :companies, :total_old_kwh_2017, :float
    add_column :companies, :total_old_price_2018, :float
    add_column :companies, :total_old_kwh_2018, :float
    add_column :companies, :total_old_price_2019, :float
    add_column :companies, :total_old_kwh_2019, :float
    add_column :companies, :total_old_price, :float
    add_column :companies, :total_old_kwh, :float
  end
end
