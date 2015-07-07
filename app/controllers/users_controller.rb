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

  def show
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Successfully Updated #{@user.name}"
      redirect_to user_path(@user)
    else
      flash[:alert] = "Update Failed"
      render :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
