class PhotosController < ApplicationController
  def index
    @photos = current_user.photos(&:images)
   end

  def user_pictures
    @user = User.find(params[:format])
    @photos = @user.photos(&:images)
  end
   
  def new
    @photo = Photo.new
  end
  
  def create
    photos = Photo.new
    
    photos.images << photos.images.attach(params[:photo][:image])
    photos.name = params["title"]["{:class=>%22form-control%22}"]
    if current_user.photos << photos
      flash[:notice] = "Successfully added new photo!"
      redirect_to photos_path
    else
     flash[:alert] = "Error adding new photo!"
     render :new
    end
  end

  def destroy
    if current_user 
      @photo = Photo.find(params[:id])
      if @photo.images.purge
        @photo.destroy
        flash[:notice] = "Successfully deleted photo"
      else 
        flash[:alert] = "Error deleteing photo"
      end
      redirect_to photos_path
    else
      flash[:alert] = "Error deleting - this is not your photo"
    end
  end
  private

  def photo_params
    params.require(:photo).permit(:name, :content, :location, images:[])
  end
end