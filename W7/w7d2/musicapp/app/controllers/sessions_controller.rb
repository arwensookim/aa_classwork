class SessionsController < ApplicationController
    
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if @user
            login_in_user!(@user)
            redirect_to user_url(@user)
        else
            # flash[:errors] = ['Access Denied, Invalid Credentials']
            # redirect_to new_session_url
            render :new
        end
    end


    def destroy
        logout!
        redirect_to new_session_url
    end
end