class Company < ApplicationRecord
    has_many :connections, dependent: :destroy
    has_many :connection_years, through: :connections
    validates :name, :category, presence: true

    include Calculators::YearlyCompanyStats
    include Calculators::TotalCompanyStats
    
end
