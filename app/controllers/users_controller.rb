class UsersController < ApplicationController
  def index
    if params[:term]
      @users = User.search_by_email(params[:term])
    else
      @users = User.all
    end
  end
end
