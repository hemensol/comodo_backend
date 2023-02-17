FactoryBot.define do
  factory :shoe_item do
    size { FFaker::Number.number }
    amount { FFaker::Number.number }
    shoe factory: :shoe
  end
end
