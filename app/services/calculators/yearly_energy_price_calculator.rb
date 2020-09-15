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
            Year::KWH_TIERS.each_with_index do |kwh_tier, index|
                if @total_remaining_kwh - kwh_tier >= 0 
                    calc_total_price(kwh_tier, index)
                    @total_remaining_kwh -= kwh_tier
                else
                    calc_total_price(@total_remaining_kwh, index)
                    break
                end
            end
            return @total_price
        end

        def calc_total_price(_multiplier, _index)
            @total_price += _multiplier * @year.send("tier_#{_index+1}_price")
        end
    end
end