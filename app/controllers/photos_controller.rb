class PhotosController < ApplicationController
  def index
    @photos = current_user.photos(&:images)
   end
  
  private

  def photo_params
    params.require(:photo).permit(:name, :content, :location, images:[])
  end
end