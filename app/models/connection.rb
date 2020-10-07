class Connection < ApplicationRecord
  belongs_to :company
  has_many :connection_years, dependent: :destroy
  has_many :years, through: :connection_years

  validates :name, uniqueness: { scope: :company_id }

  def company_name
    self.company.name
  end

  def connection_company
    self.company
  end

  def sum_of_all_years
    self.connection_years.inject(0){|sum,x| sum + x.price_euros }
  end

  # def total_amount_of_kwh
  #   self.connection_years.each do |cy| cy 
  # end
end
