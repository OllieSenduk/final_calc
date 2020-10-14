module Calculators
    module YearlyCompanyStats

        def total_kwh_per_year(year)
            connections_for(year).inject(0){|sum,x| sum + x.kwh }
        end

        def total_kwh_storage_per_year(year)
            connections_for(year).inject(0){|sum,x| sum + x.kwh_storage }
        end

        def number_of_connections_per_year(year)
            connections_for(year).count
        end

        def deduction_of_tax(year)
            num_of_connections = number_of_connections_per_year(year)
            if num_of_connections > 1 
                amount_per_connection = TaxCredit.find_by(year: year.name).amount 
                amount_per_connection * (num_of_connections - 1)
            else 
                0
            end
        end

        # REFACTOR
        def old_kwh_price_for(year)
            prices = connections_for(year).map do |connection_year|
                yearly_kwh_to_price = Calculators::YearlyKwhToPrice.new(connection_year.kwh, connection_year.year)
                yearly_kwh_to_price.total_price_euros
            end
            prices.inject(0){|sum,x| sum + x }.round(2)
        end

        def old_kwh_storage_price_for(year)
            prices = connections_for(year).map do |connection_year|
                yearly_kwh_to_price = Calculators::YearlyKwhToPrice.new(connection_year.kwh_storage, connection_year.year, 'kwh_storage')
                yearly_kwh_to_price.total_price_euros
            end
            prices.inject(0){|sum,x| sum + x }.round(2)
        end

        def new_kwh_price_for(year)
            total_kwh_for_year = total_kwh_per_year(year)
            yearly_kwh_to_price = Calculators::YearlyKwhToPrice.new(total_kwh_for_year, year)
            yearly_kwh_to_price.total_price_euros
        end

        def new_kwh_storage_price_for(year)
            total_kwh_storage_for_year = total_kwh_storage_per_year(year)
            yearly_kwh_to_price = Calculators::YearlyKwhToPrice.new(total_kwh_storage_for_year, year, 'kwh_storage')
            yearly_kwh_to_price.total_price_euros
        end

        def kwh_savings_for(year)
            (old_kwh_price_for(year) - new_kwh_price_for(year)).round(2)
        end

        def kwh_storage_savings_for(year)
            (old_kwh_storage_price_for(year) - new_kwh_storage_price_for(year)).round(2)
        end

        def connections_for(year)
            connection_years.where(year: year)
        end

    end
end