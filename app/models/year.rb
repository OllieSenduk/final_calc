class Year < ApplicationRecord
    has_many :connection_years
    has_many :connections, through: :connection_years

    KWH_TIERS = [10_000, 50_000, 10_000_000, 0]
end
