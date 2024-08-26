class SessionsController < ApplicationController

  def new
    # Renders the login form
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if @user.is_admin?
        redirect_to employees_path, flash: { success: 'Successfully Logged in!' }
      else
        redirect_to bills_path
      end
    else
      flash.now[:danger] = 'Invalid email/password'
      render 'new'
    end
  end
end
