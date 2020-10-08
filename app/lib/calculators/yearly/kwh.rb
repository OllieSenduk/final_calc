module Calculators
    module Yearly
        class Kwh
            attr_reader :total_kwh
            def initialize(company, year)
                @company = company
                @year = year
                @total_kwh = 0
                run
            end

            private

            def run
                @total_kwh = @company.connection_years.where(year: @year).inject(0){|sum,x| sum + x.kwh }
            end
        end
    end
end