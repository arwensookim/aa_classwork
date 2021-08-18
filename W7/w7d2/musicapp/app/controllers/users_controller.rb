class UsersController < ApplicationController
    def show
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            render json: "There is no user with that id"
        end
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in_user!(@user)
            redirect_to user_url(@user)
            return
        else
            render json: 'you missed something'
            # render :new
        end
    end



    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
