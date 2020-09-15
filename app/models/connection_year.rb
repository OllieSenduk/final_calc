class ConnectionYear < ApplicationRecord
  belongs_to :year
  belongs_to :connection

  monetize :price_sub_cents

end
