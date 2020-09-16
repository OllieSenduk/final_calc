class ConnectionYear < ApplicationRecord
  belongs_to :year
  belongs_to :connection

  monetize :price_sub_cents, with_model_currency: :sub_cent

  before_save :sub_cents_to_euro

  validates :connection, uniqueness: { scope: :year,
    message: "only one connection per year should be added" }

  def sub_cents_to_euro
    self.price_euros = (self.price_sub_cents / 100_000.to_f).round(2)
  end

end
