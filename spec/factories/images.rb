FactoryGirl.define do
  factory :image do |f|
    f.image_url { Faker::LoremPixel.image }
    f.event
  end
end
