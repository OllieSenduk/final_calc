class CreateYears < ActiveRecord::Migration[6.0]
  def change
    create_table :years do |t|
      t.string :name
      t.integer :tier_1_price
      t.integer :tier_2_price
      t.integer :tier_3_price
      t.integer :tier_4_price
      t.integer :tier_5_price
      t.timestamps
    end
  end
end
