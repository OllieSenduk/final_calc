class Company < ApplicationRecord
    has_many :connections, dependent: :destroy
    has_many :connection_years, through: :connections
    validates :name, :category, presence: true

    include Calculators::YearlyCompanyStats
    include Calculators::TotalCompanyStats
    

    def group_by_old_and_new_price
        [["Oude Prijs", total_old_price], ["Nieuwe prijs", total_new_price]]
    end
end
