class Users::ProfilesController < ApplicationController
  expose_decorated :user
  expose_decorated :users, -> { fetch_users }

  def show
    user = User.find(params[:id])
  end

  private

  def fetch_users
    users = User.all
    users
  end
end
