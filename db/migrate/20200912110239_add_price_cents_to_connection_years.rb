class AddPriceCentsToConnectionYears < ActiveRecord::Migration[6.0]
  def change
    add_column :connection_years, :price_sub_cents, :integer
  end
end
