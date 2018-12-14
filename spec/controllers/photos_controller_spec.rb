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

  describe "#create" do
    context "with valid attributes" do
      it "saves the new contact in the database" do
        login
        
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))
        variable = Photo.all.count
        
        post :create, params: { photo: {image: photo} }
        expect(variable).to be < Photo.all.count
      end

      it "redirects to the photos page" do
        login
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))
        
        post :create, params: { photo: {image: photo} }
        expect(response).to redirect_to photos_path
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new contact in the database" do 
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))
        variable = Photo.all.count
        post :create, params: { photo: {image: photo} }
        
        expect(variable).to be >= Photo.count
      end
      
      it "renders the user sign in page" do 
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))  
        post :create, params: { post: { photos: photo } }
        expect(response).to redirect_to user_session_path
      end
    end
  end

  describe "#user-pictures" do
    it "lists user's pictures" do
      login
      userB = create(:user)
      get :user_pictures, params: { format: userB.id}
      expect(response).to render_template 'photos/user_pictures'
    end
  end
end