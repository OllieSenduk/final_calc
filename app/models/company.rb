class Company < ApplicationRecord
    has_many :connections, dependent: :destroy

    validates :name, :category, presence: true
end
