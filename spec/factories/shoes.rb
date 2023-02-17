FactoryBot.define do
  factory :shoe do
    name { FFaker::Lorem.word }
    description { FFaker::Lorem.sentences }
  end
end
