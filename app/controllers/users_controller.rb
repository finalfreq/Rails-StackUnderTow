class UsersController < ApplicationController
  load_and_authorize_resource param_method: :user_params

  def new
  end

  def create
    if @user.save
      flash[:notice] = "Successfully registered #{@user.name} to Stack UnderTow"
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "You suck"
      render :new
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
