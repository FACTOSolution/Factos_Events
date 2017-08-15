FactoryGirl.define do
  factory :comment do |f|
    f.description { Faker::Lorem.sentence }
  end
end
