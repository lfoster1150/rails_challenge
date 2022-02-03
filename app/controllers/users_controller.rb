class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(only: [:id, :first_name, :last_name, :email])
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json(only: [:id, :first_name, :last_name, :email])
  end

end
