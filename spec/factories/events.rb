include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :event, class: Academic do |f|
    f.date { Faker::Date.between(2.days.ago, Date.today) }
    f.name { Faker::Name.name }
    f.description { Faker::Lorem.sentence }
    f.value_in_real { Faker::Number.decimal(2) }
    f.address { Faker::Address.street_name }
    f.contact { Faker::Internet.email }
    f.type 'Academic'
    f.cover { fixture_file_upload("/home/pedrohenique/Transferências/gfallen.jpeg", 'image/jpeg') }
  end

  factory :academic_event, parent: :event, class: Academic do |f|
    f.type 'Academic'
  end

  factory :cultural_event, parent: :event, class: Cultural do |f|
    f.type 'Cultural'
  end

  factory :invalid_event, parent: :event do |f|
    f.name nil
  end
end
