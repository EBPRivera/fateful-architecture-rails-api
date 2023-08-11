class UsersController < ApplicationController
  before_action :authorized, only: %i[auto_login show]

  def create
    @user = User.new(user_params)
    if @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token:}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @user
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token:}
    elsif @user
      @user.errors.add :base, "Invalid username or password"
      render json: @user.errors, status: :forbidden
    else
      render json: { user: ["User not found"] }, status: :unprocessable_entity
    end
  end

  def auto_login
    render json: @user
  end

  private

  def user_params
    params.permit(:username, :password, :password_confirmation)
  end
end
