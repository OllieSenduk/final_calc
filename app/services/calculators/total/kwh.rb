module Calculators
    module Total
        class Kwh
            def initialize(company)
                @company = company
                run
            end

            private

            def run
                @company.total_kwh = @company.connection_years.inject(0){|sum,cy| sum + cy.kwh }
            end
        end
    end
end