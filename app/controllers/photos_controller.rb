class PhotosController < ApplicationController
  def index
    @photos = current_user.images
   end
  
   def new
    @photo = Photo.new
   end
  
   def create
    if current_user.images.attach(params[:photo][:image])
     flash[:notice] = "Successfully added new photo!"
     redirect_to photos_path
    else
     flash[:alert] = "Error adding new photo!"
     render :new
    end
   end

  def show
    @photo = current_user.images.find(params[:id])
  end

  def destroy
    @photo = current_user.images.find(params[:id])
      if @photo.purge
        flash[:notice] = "Successfully deleted photo!"
        redirect_to root_path
      else
        flash[:alert] = "Error deleting photo!"
      end
    end
  private

  def photo_params
    params.require(:photo).permit(:name, :content, :location, images:[])
  end
end