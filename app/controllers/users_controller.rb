class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(only: [:id, :first_name, :last_name, :email])
  end

  def show
    user = User.find(params[:id])
    render json: user.to_json(only: [:id, :first_name, :last_name, :email])
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user.to_json(only: [:id, :first_name, :last_name, :email])
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
    def user_params
      new_user = params.require(:user).permit(:first_name, :last_name, :email)
      parsed_data = JSON.parse(new_user)
      puts("*****************", parsed_data, "**********************")
      return parsed_data
    end

end
