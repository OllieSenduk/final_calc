class ConnectionYear < ApplicationRecord
  belongs_to :year
  belongs_to :connection


  validates :connection, uniqueness: { scope: :year,
    message: "Er kan maar 1 per jaar worden toegevoegd" }


  def company
    self.connection.company
  end

  def total_price_kwh_connection_year
    Calculators::YearlyKwhToPrice.new(kwh, year, 'kwh').total_price_euros
  end

  def total_price_kwh_storage_connection_year
    Calculators::YearlyKwhToPrice.new(kwh_storage, year, 'kwh_storage').total_price_euros
  end

  def year_name
    year.name
  end


end
