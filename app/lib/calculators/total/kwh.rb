module Calculators
    module Total
        module Calculator

            def total_kwh
                self.connection_years.inject(0){|sum,cy| sum + cy.kwh }
            end

            def total_kwh_per_year(year)
                connections_for(year).inject(0){|sum,x| sum + x.kwh }
            end

            def number_of_connections()
                connections.count
            end

            def number_of_connections_per_year(year)
                connections_for(year).count
            end

            def old_price_for(year)
                connections_for(year).inject(0){|sum,cy| sum + cy.price_euros }
            end

            def new_price_for(year)
                total_kwh_for_year = total_kwh_per_year(year)
                
            end

        end
    end
end