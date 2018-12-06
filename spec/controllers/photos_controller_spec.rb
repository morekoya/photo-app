require 'rails_helper'


RSpec.describe PhotosController, type: :controller do
  describe "#index" do
    @photos = Photo.create
    get :index
    expect (response.status).to eq 200
  end
  
  describe "#new" do
    photo = Photo.new
    # post 
  end

  
end