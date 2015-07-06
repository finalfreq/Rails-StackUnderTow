class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully registered #{@user.name} to Stack UnderTow"
      redirect_to users_path
    else
      flash[:alert] = "You suck"
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
