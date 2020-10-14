class TaxCredit < ApplicationRecord
    validates_uniqueness_of :year
end
