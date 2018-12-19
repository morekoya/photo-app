
FactoryBot.define do
  
  factory :photo do
    name { FFaker::Lorem.word }    
    user_id { user.id }
    images { [ File.open(File.join(Rails.root, 'public', 'apple-touch-icon.png')) ]}
  end
end