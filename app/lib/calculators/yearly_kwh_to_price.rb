module Calculators
    class YearlyKwhToPrice

        attr_reader :total_price_euros
        
        def initialize(kwh, year)
            @kwh = kwh
            @year = year
            @total_remaining_kwh = @kwh
            @total_price_sub_cents = 0
            @total_price_euros = 0
            init_calc
        end

        def init_calc
            @counter = 0
            Year::KWH_TIERS.each_with_index do |kwh_tier, index|
                if @total_remaining_kwh - kwh_tier >= 0 
                    calc_total_price_sub_cents(kwh_tier, index)
                    @total_remaining_kwh -= kwh_tier
                    @counter += 1
                else 
                    calc_total_price_sub_cents(@total_remaining_kwh, index)
                    break
                end
            end
            @total_price_euros = (@total_price_sub_cents / 100_000.to_f).round(2)
        end

        def calc_total_price_sub_cents(_multiplier, _index)
            @total_price_sub_cents += _multiplier * @year.send("tier_#{_index+1}_price")
        end
    end
end