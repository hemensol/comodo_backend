class ShoeItem < ApplicationRecord
  belongs_to :shoe
  validates :size, :amount, presence: true
  
end
