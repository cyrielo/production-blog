class UsersController < ApplicationController

  def index
    @users = User.new
  end

  def create
    user = User.create(user_params)
    begin
      if user.save!
        filtered_user = {
          id: user.id,
          username: user.username,
          email: user.email,
          first_name: user.first_name,
          last_name: user.last_name
        }
        render json: { message: 'user account created', user: filtered_user }
      end
    rescue StandardError => e
      render json: { message: 'Unable to create account', e: e }, status: :internal_server_error
    end
  end

  def login
    render json: { message: 'login to your account here' }
  end

  def profile
    render json: { message: 'Your profile' }
  end

  private
  def user_params
    params.require(:user).permit(:username, :first_name,
      :last_name, :email, :password, :profile_photo)
  end
end
