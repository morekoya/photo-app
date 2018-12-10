require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  describe "#index" do
    it "works when signed in" do 
      user = create(:user)
      sign_in user
      get :index
      expect(response).to render_template :index
    end

    it "redirects to sign in page when not signed in" do
      get :index
      expect(response).to redirect_to user_session_path
    end
  end

  describe "#show" do
    it "should be successful" do
      user = create(:user)
      sign_in user
      photos = create(:photo)

      get :show, id: user.images.first.id
      response.should be_success
    end
  end

  describe "#create" do
    context "with valid attributes" do
      before :each do 
        user = create(:user)
        sign_in user
        file = "File.open(File.join(Rails.root, 'public', 'apple-touch-icon.png'))"
        photo = fixture_file_upload(file)
      end

      it "saves the new contact in the database" do
        
        expect(post :create, params: { post: { photos: photo } } ).to change(Photo, :count).by 1
      end

      it "redirects to the home page" do
        post :create, params: { post: { photos: photo } }
        expect(response).to render_template photo_path
      end
    end
    
    context "with invalid attributes" do
      before :all do
          PhotosController = fixture_file_upload('public', 'apple-touch-icon.png', 'image/png')
      end

      it "does not save the new contact in the database" do 
        expect(post :create, params: { post: { photos: photo } }).to_not change(Photo, :count).by 1
      end
      
      it "renders the sign_in page" do    
        post :create, params: { post: { photos: [photo] } }
        expect(response).to render_template user_session_path
      end
    end
  end
end
