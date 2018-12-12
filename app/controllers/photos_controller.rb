class PhotosController < ApplicationController
  def index
    @photos = current_user.photos(&:images)
   end
  
   def new
    @photo = Photo.new
   end
  
   def create
    photos = Photo.new
    photos.images << photos.images.attach(params[:photo][:image])
    if current_user.photos << photos
      current_user.photos.images.first.name = 'woah'
     flash[:notice] = "Successfully added new photo!"
     redirect_to photos_path
    else
     flash[:alert] = "Error adding new photo!"
     render :new
    end
   end

  def show
    @photo = current_user.photos(&:images).find(params[:id])
  end

  def destroy
    @photo = Photo.find( params[:id])
      if @photo.images.first.purge
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