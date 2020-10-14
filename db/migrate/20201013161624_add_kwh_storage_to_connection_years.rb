class AddKwhStorageToConnectionYears < ActiveRecord::Migration[6.0]
  def change
    add_column :connection_years, :kwh_storage, :integer
  end
end
