
FactoryBot.define do
  factory :photo do
    name { FFaker::Lorem.word }
    content { FFaker::Lorem.sentence }
    location { "" }
    user_id { user }
  end
end