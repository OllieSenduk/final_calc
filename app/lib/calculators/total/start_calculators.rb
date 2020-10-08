module Calculators
    module Total
        class StartCalculators
            def initialize(company)
                @company = company
                run
            end

            private

            def run
                Calculators::TotalKwhCalculator.new(@company)
                Calculators::TotalOldPriceCalculator.new(@company)
                Calculators::TotalNewPriceCalculator.new(@company)
            end
        end
    end
end