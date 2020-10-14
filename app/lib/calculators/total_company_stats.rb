module Calculators
    module TotalCompanyStats
        def total_kwh
            self.connection_years.inject(0){|sum,cy| sum + cy.kwh }
        end

        def total_kwh_storage
            self.connection_years.inject(0){|sum,cy| sum + cy.kwh_storage }
        end

        def number_of_connections()
            connections.count
        end

        def total_new_kwh_price
            costs = Year.all.map do |year|
                self.new_kwh_price_for(year)
            end

            costs.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_deduction_of_tax
            amount_of_tax_credit_removed = Year.all.map do |year|
                self.deduction_of_tax(year)
            end

            amount_of_tax_credit_removed.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_new_kwh_storage_price
            costs = Year.all.map do |year|
                self.new_kwh_storage_price_for(year)
            end

            costs.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_old_kwh_price
            costs = Year.all.map do |year|
                self.old_kwh_price_for(year)
            end

            costs.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_old_kwh_storage_price
            costs = Year.all.map do |year|
                self.old_kwh_storage_price_for(year)
            end

            costs.inject(0){|sum,x| sum + x}.round(2)
        end

        def total_kwh_savings 
            (total_old_kwh_price - total_new_kwh_price).round(2)
        end

        def total_kwh_storage_savings 
            (total_old_kwh_storage_price - total_new_kwh_storage_price).round(2)
        end

        def total_savings 
            (total_deduction_of_tax + total_kwh_storage_savings + total_kwh_savings).round(2)
        end

    end
end