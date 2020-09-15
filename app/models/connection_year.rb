class ConnectionYear < ApplicationRecord
  belongs_to :year
  belongs_to :connection

  monetize :price_sub_cents

  # before_save :calculate_price_sub_cents

  # def calculate_price_sub_cents
  #   self.price_sub_cents = Calculators::YearlyEnergyPriceCalculator.new(self)
  # end
end
