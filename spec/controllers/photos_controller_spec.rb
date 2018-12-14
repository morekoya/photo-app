require 'rails_helper'

def login
  user = create(:user)
  sign_in user
end

RSpec.describe PhotosController, type: :controller do
  describe "#index" do
    it "works when signed in" do 
      login
      get :index
      expect(response).to render_template :index
    end
  end

  
end