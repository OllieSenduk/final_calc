class Year < ApplicationRecord
    has_many :connection_years
    has_many :connections, through: :connection_years

    KWH_TIERS = [10_000, 40_000, 995_0000, 0]
end
