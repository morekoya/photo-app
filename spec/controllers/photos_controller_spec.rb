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
        
        post :create, params: { post: { photos: photo } }
        expect(variable).to be < Photo.all.count
      end

      it "redirects to the home page" do
        login
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))
        
        post :create, params: { post: { photos: photo } }
        expect(response).to render_template photo_path
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new contact in the database" do 
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))
        variable = Photo.all.count
        post :create, params: { post: { photos: photo } }
        
        expect(variable).to be >= Photo.count
      end
      
      it "renders the sign_in page" do 
        photo = fixture_file_upload(File.open(File.join(Rails.root, 'spec', 'files', 'worldmap.png')))  
        post :create, params: { post: { photos: [photo] } }
        expect(response).to render_template user_session_path
      end
    end
  end
end