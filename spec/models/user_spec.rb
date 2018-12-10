require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a unique email" do
    user = create(:user)
    user2 = build(:user, email: user.email)
    expect(user2).to_not be_valid    
  end
  it "is not valid without an email" do
    user = build(:user, email: nil)
    expect(user).to_not be_valid    
  end
  it "is not valid without a password" do
    user = build(:user, password: nil)
    expect(user).to_not be_valid    
  end

end