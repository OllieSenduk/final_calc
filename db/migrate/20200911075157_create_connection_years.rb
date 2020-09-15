class CreateConnectionYears < ActiveRecord::Migration[6.0]
  def change
    create_table :connection_years do |t|
      t.references :year, null: false, foreign_key: true
      t.references :connection, null: false, foreign_key: true
      t.integer :kwh
      t.timestamps
    end
  end
end
