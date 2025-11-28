class UsersController < ApplicationController
  before_action :check_if_signup_is_allowed, only: [ :new, :create ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully signed up!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def check_if_signup_is_allowed
    redirect_to root_path, alert: "Sign up is not allowed." unless Setting.instance.allow_sign_up
  end
end
