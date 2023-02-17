class Shoe < ApplicationRecord
    has_many :shoe_items
    validates :name, presence: true

end
