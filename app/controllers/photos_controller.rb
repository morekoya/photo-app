class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at')
   end
  
   def new
    @photo = Photo.new
   end
  
   def create
    # @photo = Photo.new(photo_params)
    @photo = Photo.create! params.require(:photo).permit(photo_params)
    # @photo.images.attach(params[:images])
    @photo.name = params[:title]["{:class=>%22form-control%22}"]
    if @photo.save
     flash[:notice] = "Successfully added new photo!"
     redirect_to root_path
    else
     flash[:alert] = "Error adding new photo!"
     render :new
    end
   end

  def show
    @photo = Photo.find(params[:id])
    # @current_user = current_user
  end

  def destroy
    @photo = Photo.find(params[:id])
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