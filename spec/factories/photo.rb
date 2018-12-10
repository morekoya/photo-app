
FactoryBot.define do
  factory :photo do
    name { FFaker::Lorem.word }    
    user_id { 1 } 
    images { [ File.open(File.join(Rails.root, 'public', 'apple-touch-icon.png')) ]}
  end
end