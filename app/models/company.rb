class Company < ApplicationRecord
    has_many :connections, dependent: :destroy
    has_many :connection_years, through: :connections
    validates :name, :category, presence: true

    include Calculators::YearlyCompanyStats
    include Calculators::TotalCompanyStats
    

    def group_by_old_and_new_price_for_kwh
        [["Oude Kwh Prijs", total_old_kwh_price], ["Nieuwe Kwh prijs", total_new_kwh_price]]
    end

    def group_by_old_and_new_price_for_kwh_storage
        [["Oude Kwh opslag Prijs", total_old_kwh_storage_price], ["Nieuwe Kwh opslag prijs", total_new_kwh_storage_price]]
    end
end
