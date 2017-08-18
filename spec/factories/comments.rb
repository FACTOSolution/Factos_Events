FactoryGirl.define do
  factory :comment do |f|
    f.description { Faker::Lorem.sentence }
  end

  factory :assoc_comment, parent: :comment do |f|
    f.event
  end
end
