module Calculators
    module YearlyCompanyStats

        def total_kwh_per_year(year)
            connections_for(year).inject(0){|sum,x| sum + x.kwh }
        end

        def number_of_connections_per_year(year)
            connections_for(year).count
        end

        def old_price_for(year)
            prices = connections_for(year).map do |connection_year|
                yearly_kwh_to_price = Calculators::YearlyKwhToPrice.new(connection_year.kwh, connection_year.year)
                yearly_kwh_to_price.total_price_euros
            end
            prices.inject(0){|sum,x| sum + x }.round(2)
        end

        def new_price_for(year)
            total_kwh_for_year = total_kwh_per_year(year)
            yearly_kwh_to_price = Calculators::YearlyKwhToPrice.new(total_kwh_for_year, year)
            yearly_kwh_to_price.total_price_euros
        end

        def savings_for(year)
            (old_price_for(year) - new_price_for(year)).round(2)
        end

        def connections_for(year)
            connection_years.where(year: year)
        end

    end
end