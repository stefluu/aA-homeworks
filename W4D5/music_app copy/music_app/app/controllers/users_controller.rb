class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      render :new
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end


  def show
    @user = User.find_by(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
