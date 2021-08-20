class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            flash[:errors]
            redirect_to users_url
        end
    end

    def new
        @user = User.new
        render :new

    end

    def create
        @user = User.new(user_params)
        if @user.save
            # login(@user)
            redirect_to user_url(@user)
            return
        else
            flash.now[:errors] = ['Sign Up Fail']
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
    
end
