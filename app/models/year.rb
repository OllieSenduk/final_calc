class Year < ApplicationRecord
    has_many :connection_years
    has_many :connections, through: :connection_years
    validates_uniqueness_of :name
    KWH_TIERS = [10_000, 40_000, 995_0000, 0]
end
