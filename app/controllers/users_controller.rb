class UsersController < ApplicationController
  expose_decorated :user

  def show
    user = User.find(params[:id])
  end

  def edit
    user = current_user
  end
end
