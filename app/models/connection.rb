class Connection < ApplicationRecord
  belongs_to :company
  has_many :years
  has_many :connection_years
  has_many :years, through: :connection_years

  def company_name
    self.company.name
  end

  def connection_company
    self.company
  end
end
