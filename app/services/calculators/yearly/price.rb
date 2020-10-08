module Calculators
    module Yearly
    class Price

        attr_reader :total_price_sub_cents
        
        def initialize(kwh, year)
            @kwh = kwh
            @year = year
            @total_remaining_kwh = @kwh
            @total_price_sub_cents = 0

            init_calc
        end

        def init_calc
            @times = 0
            Year::KWH_TIERS.each_with_index do |kwh_tier, index|
                if @total_remaining_kwh - kwh_tier >= 0 
                    calc_total_price_sub_cents(kwh_tier, index)
                    @total_remaining_kwh -= kwh_tier
                    @times += 1
                else 
                    calc_total_price_sub_cents(@total_remaining_kwh, index)
                    @times += 1
                    break
                end
            end
            return @total_price_sub_cents
        end

        def calc_total_price_sub_cents(_multiplier, _index)
            @total_price_sub_cents += _multiplier * @year.send("tier_#{_index+1}_price")
        end
    end
end