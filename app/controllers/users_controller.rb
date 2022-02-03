class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(only: [:id, :first_name, :last_name, :email])
  end
end
