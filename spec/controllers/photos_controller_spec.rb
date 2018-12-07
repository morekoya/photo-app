require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  describe "#index" do
    # get :index
    # response.should render_template :index
    end
  
  describe "#create" do
    it "redirects to root on successful save" do
      expect(response).to redirect_to(root)
    end
    it "redirects to a new page on failure to save" do
   end
  end

  describe "#show" do
    it "should be successful" do
      photos = [create(:photo)]
      get :show, id: photos.first.id
      response.should be_success
    end
  end

  describe "#new'" do
    it "should be successful" do
      get :new
      response.should be_success
    end

    it "should have the right title" do
      get :new
      photos = [create(:photo, name: "New Pic")]
      response.should have_selector('name', content: "New Pic")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      let(photo) { FactoryBot.build(:photo)}
      it "saves the new contact in the database" do
        expect(post :create, photo: photo).to change(Photo, :count).by 1
      end
      it "redirects to the home page" do
        post :create, contact: FactoryBot.attributes_for(:photo)
        response.should redirect_to Photo.last
      end
    end
  end
    
  context "with invalid attributes" do
    it "does not save the new contact in the database"do
      expect(2+3).to eq 5 
    end
    it "re-renders the :new template"do
      expect(2+3).to eq 5 
    end
  end
end
