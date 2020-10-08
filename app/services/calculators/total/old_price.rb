module Calculators
    module Total
        class OldPrice
            def initialize(company)
                @company = company
                run
            end

            private

            def run
                @company.total_old_price = @company.connection_years.inject(0){|sum,cy| sum + cy.price_euros }
            end
        end
    end
end