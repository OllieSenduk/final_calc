class ConnectionYear < ApplicationRecord
  belongs_to :year
  belongs_to :connection

  monetize :price_sub_cents, with_model_currency: :sub_cent

  before_save :sub_cents_to_euro
  after_save :save_new_year_amount_for_company

  validates :connection, uniqueness: { scope: :year,
    message: "only one connection per year should be added" }

  def sub_cents_to_euro
    self.price_euros = (self.price_sub_cents / 100_000.to_f).round(2)
  end

  def company
    self.connection.company
  end

  def save_new_year_amount_for_company
    Calculators::NewPriceCalculatorPerYear.new(self.company, self.year)
  end

end
