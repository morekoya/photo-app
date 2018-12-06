require 'rails_helper'

RSpec.describe Photo, type: :model do
  it "belongs to a user" do
    user = FactoryBot.create(:user)
    
    photos = [create(:photo, user: user)]
    expect(photos.first.user_id).to eq(user.id)
  end

end