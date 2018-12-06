class UsersController < ApplicationController
  def attach_image
    current_user.photo.attach(params[:photo])
    redirect_to user
  end

  private

end