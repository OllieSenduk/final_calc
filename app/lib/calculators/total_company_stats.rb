module Calculators
    module TotalCompanyStats
        def total_kwh
            self.connection_years.inject(0){|sum,cy| sum + cy.kwh }
        end

        def number_of_connections()
            connections.count
        end

        def total_new_price
            costs = Year.all.map do |year|
                self.new_price_for(year)
            end

            costs.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_old_price
            costs = Year.all.map do |year|
                self.old_price_for(year)
            end

            costs.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_savings 
            total_old_price - total_new_price
        end

    end
end