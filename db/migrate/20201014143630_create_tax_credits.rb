class CreateTaxCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :tax_credits do |t|
      t.string :year
      t.float :amount

      t.timestamps
    end
  end
end
