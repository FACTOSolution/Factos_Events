include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :event, class: Academic do |f|
    f.date { Faker::Date.forward(10) }
    f.name { Faker::Name.name }
    f.description { Faker::Lorem.sentence }
    f.value { Faker::Number.decimal(2) }
    f.address { Faker::Address.street_name }
    f.contact { Faker::Internet.email }
    f.type 'Academic'
    f.published false
    f.lat { Faker::Address.latitude }
    f.long { Faker::Address.longitude }
    f.user
  end

  factory :academic_event, parent: :event, class: Academic do |f|
    f.type 'Academic'
  end

  factory :cultural_published_event, parent: :event, class: Cultural do |f|
    f.type 'Cultural'
    f.published true
    after(:create) do |event|
      create(:image, event: event)
    end
  end

  factory :academic_published_event, parent: :event, class: Academic do |f|
    f.type 'Academic'
    f.published true
    after(:create) do |event|
      create(:image, event: event)
    end
  end

  factory :cultural_event, parent: :event, class: Cultural do |f|
    f.type 'Cultural'
  end

  factory :invalid_event, parent: :event do |f|
    f.name nil
  end

  factory :event_with_images, parent: :event do
    after(:create) do |event|
      create(:image, event: event)
      create(:image, event: event)
    end
  end
end
