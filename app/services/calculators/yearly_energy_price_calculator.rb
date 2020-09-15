module Calculators
class YearlyEnergyPriceCalculator 
    def initialize(connection_year)
        @kwh = connection_year.kwh
        @year = connection_year.year
        @total_remaining_kwh = @kwh
        @total_price = 0

        init_calc
    end

    def init_calc
        Year.KWH_TIERS.each_with_index do |kwh_tier, index|
        if @total_remaining_kwh - kwh_tier >= 0 
            calc_total_price(kwh_tier)
            @total_remaining_kwh -= kwh_tier
            raise
        else
            calc_total_price(@total_remaining_kwh)
            break
        end
        return @total_price
    end

    def calc_total_price(multiplier)
        @total_price += multiplier * year.send("tier_#{index+1}_price"
    end
end
end