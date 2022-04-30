class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in successfully"
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:alert] = "There was somethin wron with you login details."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil 
    flash[:notice] = "Logged out"
    redirect_to root_path, status: :see_other
  end
end