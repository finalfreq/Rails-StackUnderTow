class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.authenticate(params[:name], params[:password])
    if @user
      flash[:notice] = "You're caught in the UnderTow now!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] ="You've been logged out!"
    redirect_to root_path
  end
end
