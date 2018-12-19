require 'rails_helper'

def login
  user = create(:user)
  sign_in user
end

RSpec.describe UsersController, type: :controller do
  describe '#index'
    it 'shows all users' do
      login
      get :index 
      expect(response).to render_template("index")
      expect(response.status).to eq(200)
    end
  end