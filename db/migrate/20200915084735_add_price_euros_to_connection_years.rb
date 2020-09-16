class AddPriceEurosToConnectionYears < ActiveRecord::Migration[6.0]
  def change
    add_column :connection_years, :price_euros, :float
  end
end
