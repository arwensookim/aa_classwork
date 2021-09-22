class Api::SessionsController < ApplicationController

  def create
    # Find user by credentials
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    # Flash errors, if any.
    # Render :new if invalid credentials (give the user another chance to login)
    if @user.nil?
      flash.now[:errors] = ['Invalid username or password.']
      render 'api/users/show'
    else
    # Log them in and redirect them if we find them
      login!(@user)
      # redirect_to user_url(@user)
      render 'api/users/show'
    end

  end

  def destroy
    if (!current_user)
      render json: ['You must be logged in first']
    end
    logout!
    # redirect to login page
    #redirect_to new_session_url
    render json:{}
  end
end