class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])

        if @user
            render :show
        else
            flash[:errors] = ['There is no user with that id']
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
            login(@user)8
            redirect_to user_url(@user)
            return
        else
            flash.now[:errors] = ['You Missed Something']
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
