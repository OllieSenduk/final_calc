class Connection < ApplicationRecord
  belongs_to :company
  has_many :years
  has_many :connection_years
  has_many :years, through: :connection_years

  validates :name, uniqueness: true

  def company_name
    self.company.name
  end

  def connection_company
    self.company
  end

  def sum_of_all_years
    self.connection_years.inject(0){|sum,x| sum + x.price_euros }
  end

  def new_price
  end
end
