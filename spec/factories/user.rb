
FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { "p4ssw0rd" }
  end
end