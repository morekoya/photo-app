require 'rails_helper'

RSpec.describe Photo, type: :model do
  it "has a name" do 
    photo = create(:photo, name:"New Pic")
    expect(photo.name).to eq "New Pic"
  end
end