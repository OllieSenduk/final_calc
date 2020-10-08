module Calculators
   module Yearly
    class NewPrice

     def initialize(company, year)
        @company = company
        @year = year
        calculate
     end

     def calculate
        connections_for_year = @company.connections.map do |connection|
             connection.connection_years.select { |connection_year| connection_year.year == @year }
        end[0]
        total_kwh_for_year = connections_for_year.inject(0){|sum,x| sum + x.kwh }
        total_price_for_year = Calculators::Price.new(total_kwh_for_year, @year).total_price_sub_cents
        total_price_for_year_euros = (total_price_for_year / 100_000.to_f).round(2)
        @company.send("total_kwh_#{@year.name}=", total_kwh_for_year) 
        @company.send("total_price_#{@year.name}=", total_price_for_year_euros) 
        @company.save!
     end
    end
   end
end